/// @description powerup stats and functions
func_starting_state = function() {
	func_saw_starting_movement();
}

func_sawing_state = function() {
	func_destroy_obstacles();
	func_sawing_movement();
}

func_falling_state = function() {
	func_destroy_obstacles();
	func_saw_falling_movement();
}

stopY = round(room_height / 10) + obj_mole_boy.centerYDiff;
distance = round(room_width / 3);
spawnY = -48;

hitGround = false;
hitBounce = -6;
vspd = 0;
normalGravityAcceleration = .8;
maxGravityPull = 14;
state = func_starting_state;
fallCnt = 0;
fallTimeLimit = 600;
falling = false;

dirtSpawnCnt = 0;
dirtSpawnTimeLimit = 5;
dirtYSpawnDiff = 16;

dir = 1;
sawingAngleIncVal = 4;
sawingAngle = -180;
sawingStartAngle = -180;
sawingEndAngle = 0;
deleteY = room_height + 128;