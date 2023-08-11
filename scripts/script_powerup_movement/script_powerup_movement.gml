function func_saw_starting_movement(){
	y = min(y + vspd, stopY);
	if (vspd < maxGravityPull) {
		vspd = min(maxGravityPull, vspd + normalGravityAcceleration);
	}
	if (y >= stopY) {
		if (!hitGround) {
			hitGround = true;
			vspd = hitBounce;
		}
		else {
			vspd = 0;
			if (!global.powerupActivated) {
				state = func_sawing_state;
			}
		}
	}
}

function func_switch_saw_direction(_saw) {
	_saw.dir *= -1;
	_saw.image_xscale *= -1;
	_saw.sawingAngleIncVal *= -1;
	var _tempAngle = _saw.sawingStartAngle;
	_saw.sawingStartAngle = _saw.sawingEndAngle;
	_saw.sawingAngle = _saw.sawingStartAngle;
	_saw.sawingEndAngle = _tempAngle;
}

function func_sawing_movement() {
	sawingAngle += ceil(sawingAngleIncVal * global.currentExcavationSpeed);
	if ((sawingAngle > sawingEndAngle && (dir == 1)) || (sawingAngle < sawingEndAngle && (dir == -1))) {
		if (fallCnt >= fallTimeLimit) {
			state = func_falling_state;
			falling = true;
			vspd -= 8;
			exit;
		}
		func_switch_saw_direction(self);
	}
	if (instance_exists(obj_mole_boy)) {
		x = round(lengthdir_x(distance, sawingAngle)) + obj_mole_boy.x;
		y = floor(lengthdir_y(distance, sawingAngle)) + obj_mole_boy.y + obj_mole_boy.centerYDiff;
	}
	fallCnt++;
}

function func_saw_falling_movement() {
	y += vspd;
	if (vspd < maxGravityPull) {
		vspd = min(maxGravityPull, vspd + normalGravityAcceleration);
	}
	if (y > deleteY) {
		global.powerActive = false;
		instance_destroy();
	}
}

function func_destroy_obstacles() {
	while (place_meeting(x, y, obj_rock_sturdy_obstacle)) {
		var sturdyRock = instance_nearest(x, y, obj_rock_sturdy_obstacle);
		instance_create_depth(sturdyRock.x, sturdyRock.y, 0, obj_rock_sturdy_broken);  // new broken rock that plays animation
		instance_destroy(instance_nearest(x, y, obj_rock_sturdy_obstacle));
		global.newWinnings += obj_mole_boy.sturdyRockCash;
		func_rock_destroy_sound();
	}
	while (place_meeting(x, y, obj_rock_obstacle)) {
		var rock = instance_nearest(x, y, obj_rock_obstacle);
		instance_create_depth(rock.x, rock.y, 0, obj_rock_broken);  // new broken rock that plays animation
		instance_destroy(instance_nearest(x, y, obj_rock_obstacle));
		global.newWinnings += obj_mole_boy.rockCash;
		func_rock_destroy_sound();
	}
	if (place_meeting(x, y, obj_question_enemy)) {
		var questionEnemy = instance_nearest(x, y, obj_question_enemy);
		if (!questionEnemy.escaping) {
			instance_create_depth(questionEnemy.x, questionEnemy.y, 0, obj_rock_question_broken);  // new broken rock that plays animation
			if (!(questionEnemy.right)) {
				obj_rock_question_broken.xscale = -1;
			}
			instance_destroy(instance_nearest(x, y, obj_question_enemy));
			if (obj_mole_boy.powerUp2 == 0) {
				obj_mole_boy.powerUp2 = 1;
				obj_mole_boy.addRightPowerupSprite = true;
			}
			else {
				global.newWinnings += obj_mole_boy.questionRockCash;
			}
			instance_create_layer(x, y, "Instances", obj_question_enemy_dead);
			func_rock_destroy_sound();
		}
	}
	while (place_meeting(x, y, obj_saw_obstacle)) {
		var saw = instance_nearest(x, y, obj_saw_obstacle);
		instance_create_depth(saw.x, saw.y, 0, obj_saw_broken);
		instance_destroy(instance_nearest(x, y, obj_saw_obstacle));
	}
}