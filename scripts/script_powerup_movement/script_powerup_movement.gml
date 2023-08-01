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
		show_debug_message(sawingAngle);
		show_debug_message(sawingStartAngle);
		show_debug_message(sawingEndAngle);
		func_switch_saw_direction(self);
	}
	else {
		if (instance_exists(obj_mole_boy)) {
			x = round(lengthdir_x(distance, sawingAngle)) + obj_mole_boy.x;
			y = floor(lengthdir_y(distance, sawingAngle)) + obj_mole_boy.y + obj_mole_boy.centerYDiff;
		}
	}
}