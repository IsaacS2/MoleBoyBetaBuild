/// @description Obstacle movement and stuff
if (global.gamePaused) {
	exit;
}

func_static_obstacle_movement(floor(global.layerSpeed / global.rockSlowDown));

if (place_meeting(x, y, obj_mole_boy) && !moleInside) {
	moleInside = true;
	obj_mole_boy.restartInsideRockSound = true;
}
else if (!place_meeting(x, y, obj_mole_boy) && moleInside) {
	moleInside = false;
}

if (y < yDelete) {
	instance_destroy();
}