/// @description Move Dirt Patch!
if (global.gamePaused) {
	exit;
}

func_static_obstacle_movement(floor(global.layerSpeed / global.rockSlowDown));