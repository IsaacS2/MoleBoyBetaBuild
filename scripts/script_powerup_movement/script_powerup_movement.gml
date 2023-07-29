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
			state = func_sawing_state;
			vspd = 0;
		}
	}
}