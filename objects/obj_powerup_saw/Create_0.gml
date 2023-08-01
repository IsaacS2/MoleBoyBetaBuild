/// @description powerup stats and functions
func_starting_state = function() {
	func_saw_starting_movement();
}

func_sawing_state = function() {
	func_sawing_movement();
}

func_falling_state = function() {
	
}

stopY = round(room_height / 10) + obj_mole_boy.centerYDiff;
distance = round(room_width / 3);
spawnY = -48;

hitGround = false;
hitBounce = -6;
vspd = 0;
normalGravityAcceleration = 1;
maxGravityPull = 32;
state = func_starting_state;

dirtSpawnCnt = 0;
dirtSpawnTimeLimit = 5;
dirtYSpawnDiff = 16;

dir = 1;
sawingAngleIncVal = 4;
sawingAngle = -180;
sawingStartAngle = -180;
sawingEndAngle = 0;