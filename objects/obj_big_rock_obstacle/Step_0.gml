/// @description Obstacle movement and stuff
if (global.gamePaused) {
	exit;
}

func_static_obstacle_movement(2 / global.rockSlowDown);

if (y < yDelete) {
	instance_destroy();
}