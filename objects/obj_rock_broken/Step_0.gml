/// @description Obstacle movement and stuff!
if (global.gamePaused) {
	exit;
}

func_static_obstacle_movement(floor(yMovement / global.rockSlowDown));

if (y < yDelete) {
	instance_destroy();
}

if (image_index >= 11) {
	instance_destroy();
}

