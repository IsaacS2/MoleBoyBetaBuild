// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_movement(_obj, _direction, _maxDist){
	var i = _maxDist;
	while (i >= 1) {
		if (!place_meeting(_obj.x + (_direction * i) , _obj.y , obj_boundary)) {
			x += i * _direction;
			return i;  // return values will show movement difference, not direction (it's never negative)
		}
		i--;
	}
	if (i <= 0 && place_meeting(_obj.x, _obj.y, obj_boundary)) {
		var j = i;
		// must check if boundary is in front of player first
		if (place_meeting(_obj.x + _direction, _obj.y, obj_boundary)) {
			while (place_meeting(_obj.x, _obj.y, obj_boundary)) {
				x -= _direction;
				j += 1;
			}
		} else {  // boundary is behind Mole Boy
			while (place_meeting(_obj.x, _obj.y, obj_boundary)) {
				x += _direction;
				j += 1;
			}
		}
		return j;
	} else {
		return 0;  // Mole Boy is right beside the boundary and will not move horizontally
	}
}


function func_switchTo_drilling() {
	image_angle = 0;
	currentSprite = attackingSprite;
	right = 0;  // no more x-movement
	momentum = 0;  // no more momentum
	directionIncVal = 0;
	noInputIncVal = 0;
}


function func_destroy_rocks() {
	while (place_meeting(x, y, obj_rock_sturdy_obstacle)) {
		var sturdyRock = instance_nearest(x, y, obj_rock_sturdy_obstacle);
		instance_create_depth(sturdyRock.x, sturdyRock.y, 0, obj_rock_sturdy_broken);  // new broken rock that plays animation
		instance_destroy(instance_nearest(x, y, obj_rock_sturdy_obstacle));
		global.newWinnings += sturdyRockCash;
	}
	while (place_meeting(x, y, obj_rock_obstacle)) {
		var rock = instance_nearest(x, y, obj_rock_obstacle);
		instance_create_depth(rock.x, rock.y, 0, obj_rock_broken);  // new broken rock that plays animation
		instance_destroy(instance_nearest(x, y, obj_rock_obstacle));
		global.newWinnings += rockCash;
	}
	if (place_meeting(x, y, obj_question_enemy)) {
		var questionEnemy = instance_nearest(x, y, obj_question_enemy);
		if (!questionEnemy.escaping) {
			instance_create_depth(questionEnemy.x, questionEnemy.y, 0, obj_rock_question_broken);  // new broken rock that plays animation
			if (!(questionEnemy.right)) {
				obj_rock_question_broken.xscale = -1;
			}
			instance_destroy(instance_nearest(x, y, obj_question_enemy));
			if (powerUp2 == 0) {
				powerUp2 = 1;
				addRightPowerupSprite = true;
			}
			else {
				global.newWinnings += questionRockCash;
			}
			instance_create_layer(x, y, "Instances", obj_question_enemy_dead);
		}
	}
}


function func_right_movement() {
	right = 1; // confirms player direction held
	if (momentum < maxMomentum && (global.rockSlowDown & outsideRockSpeed)) { // momentum can be increased
		momentum = min((momentum + directionIncVal), maxMomentum); // we don't want anything above maxMomentum
	}
	//
	// In case momentum is larger and opposite to movement value, the sign of the
	// sum will be used to determine when/where Mole Boy is moving and what collisions to
	// watch out for. 
	//
	// image is rotated slighty to enhance feeling of movement
	image_angle = momentum * angleMultiplier;
	func_movement(obj_mole_boy, sign(movement + momentum), abs(movement + momentum));
}


function func_left_movement() {
	right = -1;
	if (momentum > -maxMomentum && (global.rockSlowDown & outsideRockSpeed)) { // momentum can be lowered (as in, influencing left mvmt)
		// don't want anything below -maxMomentum
		momentum = max((momentum - directionIncVal), -maxMomentum);
	}
	image_angle = momentum * angleMultiplier;
	func_movement(obj_mole_boy, sign(-movement + momentum), abs(-movement + momentum));
}


function func_momentumOnly_movement() {
	right = 0;
	if (momentum > 0) { // leftover momentum from right movement
		momentum = max((momentum - noInputIncVal), 0); // don't want to go below zero
		image_angle = momentum * angleMultiplier;
		func_movement(obj_mole_boy, sign(momentum), abs(momentum)); // only momentum alters x
	}
	else if (momentum < 0) { // leftover momentum from left movement
		momentum = min((momentum + noInputIncVal), 0); // don't want to go above zero
		image_angle = momentum * angleMultiplier;
		func_movement(obj_mole_boy, sign(momentum), abs(momentum));
	}
}


function func_left_and_right_movement() {
	if (keyRight && !keyLeft) {
		func_right_movement();
	}
	else if (!keyRight && keyLeft) {
		func_left_movement();
	} 
	else if ( (keyLeft == keyRight) && (global.rockSlowDown & outsideRockSpeed)) {
		func_momentumOnly_movement();
	}
}


function func_switchTo_returning() {
	drillCnt = 0;
	drillStallCnt = 0;
	directionIncVal = round(baseDirectionIncVal * global.currentMoleBoySpeed);
	noInputIncVal = round(baseNoInputIncVal * global.currentMoleBoySpeed);
	currentSprite = normalSprite;
}


function func_switchFrom_returning_and_yMovement() {
	// Mole Boy moving back to top of the screen
	// TODO: Test this returning mechanic (x2 slower vertical speed when in rock)
	// and decide whether this mechanic is better than the current mechanic.
	/*
	if ((global.rockSlowDown & outsideRockSpeed)) {
	  y -= returnY;
	}
	else {
	  y -= floor(returnY / 2);
	}
	*/
	var layerRockSpeed = floor(global.layerSpeed / global.rockSlowDown);
	if ((global.rockSlowDown & outsideRockSpeed) 
	|| returnY < layerRockSpeed) {  // Mole Boy outside rock or slower than rock speed
		y -= returnY;
	}
	else {
		y -= layerRockSpeed;
	}
	if (y <= startY) {
		y = startY;
	}
}


function func_switchTo_inRock() {
	sprite_set_speed(sprite_index, 30, spritespeed_framespersecond);
	momentum = 0;
	image_angle = 0;
	movement = floor (movement / 2);
	global.rockSlowDown = insideRockSpeed;
	// For altering background speed
	layer_vspeed(obj_control.lay_id, -floor(global.layerSpeed / global.rockSlowDown));
}


function func_switchFrom_inRock() {
	sprite_set_speed(sprite_index, 60, spritespeed_framespersecond);
	movement = normalMovement;
	global.rockSlowDown = outsideRockSpeed;
	layer_vspeed(obj_control.lay_id, -floor(global.layerSpeed / global.rockSlowDown));
}

function func_switchTo_dead() {
	func_initialize_death_screen();
	sprite_set_speed(sprite_index, 60, spritespeed_framespersecond);
	image_angle = 0;
	state = func_death_state;
	currentSprite = stunnedSprite;
	image_speed = 1;
}

function func_sprite_switch(_spr) {
	currentSprite = _spr;
	sprite_index = _spr;
	image_index = 0;
}

function func_switchTo_powerup_activate() {
	leftSaw = instance_create_layer(x - round(room_width/3), y - 48, "Instances", obj_powerup_saw);
	rightSaw = instance_create_layer(x + round(room_width/3), y - 72, "Instances", obj_powerup_saw);
	rightSaw.dir = -1;
	rightSaw.image_xscale = -1;
	func_initialize_powerup_screen();
	state = func_powerup_state;
	func_sprite_switch(powerupSawSprite);
	momentum = 0;
	image_angle = 0;
	image_speed = 1;
}

function func_switchFrom_powerup_activate() {
	func_sprite_switch(normalSprite);
	state = func_neutral_state;
	image_angle = 0;
	func_unfreeze_screen();
	currPowerupIndex = 0;
	global.powerupActivated = false;
	global.gamePaused = false;
}