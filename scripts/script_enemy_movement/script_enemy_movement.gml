// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_question_enemy_movement(_xMovement, _yMovement) {
	x += _xMovement;
	y -= _yMovement;
	
	//imageAngle = (randomYBoost * yMultiple) - (yMultiple * 2);
}

function func_question_enemy_turn() {
	spinAngle += ceil(spinAngleIncVal * global.currentExcavationSpeed);
	if ((spinAngle >= spinEndAngle && !right) || (spinAngle <= spinEndAngle && right)) {
		func_reset_spin();
	}
	else {
		x = round(lengthdir_x(spinDistance, spinAngle)) + spinXPoint;
		y = floor(lengthdir_y(spinDistance, spinAngle)) + spinYPoint;
	}
}

function func_move_dead_enemy() {
	x += xMovement;
	y += vspd;
	if (vspd < maxGravityPull) {
		vspd = min(maxGravityPull, vspd + normalGravityAcceleration);
	}
	image_angle += turnSpeed;
}