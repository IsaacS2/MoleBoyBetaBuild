// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//
// global variables
//
// Global variable pause mechanic from https://www.youtube.com/watch?v=JwWuZXyTzN0&t=1426s
//
global.gamePaused = false;

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
		if (place_meeting(_obj.x + (_direction * 0.01), _obj.y, obj_boundary)) {
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

/*
function func_destroy_rock() {
	while (place_meeting(x, y, obj_rock_obstacle)) {
		rock = instance_nearest(x, y, obj_rock_obstacle)
		instance_create_depth(rock.x, rock.y, 0, obj_rock_broken);  // new broken rock that plays animation
		instance_destroy(instance_nearest(x, y, obj_rock_obstacle));
		global.newWinnings += rockCash;
	}
}

function func_enter_rock() {
	sprite_set_speed(sprite_index, 30, spritespeed_framespersecond);
	state = func_in_rock_state;
	momentum = 0;
	image_angle = 0;
	movement = floor (movement / 2);
	global.rockSlowDown = insideRockSpeed;
	// For altering background speed
	layer_vspeed(obj_control.lay_id, -floor(global.layerSpeed / global.rockSlowDown));
}

function func_exit_rock() {
	if (y != yStart) {
		state = func_stalling_state;
	}
	else {
		state = func_neutral_state;
	}
	sprite_set_speed(sprite_index, 60, spritespeed_framespersecond);
	movement = currMovement;
	global.rockSlowDown = outsideRockSpeed;
	// For returning background speed to normal
	layer_vspeed(obj_control.lay_id, -floor(global.layerSpeed / global.rockSlowDown));
}

function func_direction_input_movement() {
	if (keyRight && !keyLeft) {
		right = 1; // confirms player direction held
		if (momentum < maxMomentum && state != func_in_rock_state) { // momentum can be increased
			momentum = min((momentum + directionInc), maxMomentum); // we don't want anything above maxMomentum
		}
		//
		// In case momentum is larger and opposite to movement value, the sign of the
		// sum will be used to determine when/where Mole Boy is moving and what collisions to
		// watch out for. 
		//
		// image is rotated slighty to enhance feeling of movement
		image_angle = momentum * 2;
		func_movement(obj_mole_boy, sign(movement + momentum), abs(movement + momentum));
	}
	else if (!keyRight && keyLeft) {
		right = -1;
		if (momentum > -maxMomentum && state != func_in_rock_state) { // momentum can be lowered (as in, influencing left mvmt)
			// don't want anything below -maxMomentum
			momentum = max((momentum - directionInc), -maxMomentum);
		}
		image_angle = momentum * 2;
		func_movement(obj_mole_boy, sign(-movement + momentum), abs(-movement + momentum));
	} 
	
	// not moving (simulates momentum in controls by SLOWLY stopping Mole Boy when
	// there's no input and a direction was held previously)
	else if (keyLeft == keyRight && state != func_in_rock_state) {
		func_direction_no_input_movement();
	}
}

function func_attack_input_movement() {
	if (keyAttack) { // Drilling time!
		image_angle = 0;
		state = func_drilling_state;
		sprite_index = spr_mole_boy_drilling_red;
		right = 0;  // no more x-movement
		momentum = 0;  // no more momentum
		func_destroy_rock();
	}
}

function func_direction_no_input_movement() {
	right = 0;
	if (momentum > 0) { // leftover momentum from right movement
		momentum = max((momentum - noInputInc), 0); // don't want to go below zero
		image_angle = momentum * 2;
		func_movement(obj_mole_boy, sign(momentum), abs(momentum)); // only momentum alters x
	}
	else if (momentum < 0) { // leftover momentum from left movement
		momentum = min((momentum + noInputInc), 0); // don't want to go above zero
		image_angle = momentum * 2;
		func_movement(obj_mole_boy, sign(momentum), abs(momentum));
	}
}
*/