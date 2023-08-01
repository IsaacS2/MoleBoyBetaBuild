/// @description powerup stats and functions
func_starting_state = function() {
	func_saw_starting_movement();
}

func_sawing_state = function() {
	
}

func_falling_state = function() {
	
}

dir = 1;
stopY = round(room_height / 10);
spawnX = round(room_width / 3);
spawnY = -48;

hitGround = false;
hitBounce = -6;
vspd = 0;
normalGravityAcceleration = .8;
maxGravityPull = 32;
state = func_starting_state;

dirtSpawnCnt = 0;
dirtSpawnTimeLimit = 10;
dirtYSpawnDiff = 16;