/// @description Obstacle movement and stuff!
if (global.gamePaused) {
	exit;
}

func_static_obstacle_movement(floor(global.layerSpeed / global.rockSlowDown));

if (y < yDelete || image_index >= 12) {
	instance_destroy();
}