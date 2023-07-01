/// @description Broken question rock movement and stuff!
if (global.gamePaused) {
	exit;
}

func_static_obstacle_movement(floor(global.layerSpeed / global.rockSlowDown));

if (y < yDelete || image_index >= 17) {
	instance_destroy();
}