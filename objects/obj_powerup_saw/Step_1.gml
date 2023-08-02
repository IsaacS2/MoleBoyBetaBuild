/// @description Move saw!
if (global.gamePaused && !global.powerupActivated) {
	exit;
}

state();

if (!global.gamePaused) {
	dirtSpawnCnt += 1 / global.rockSlowDown;

	if (dirtSpawnCnt > dirtSpawnTimeLimit) {
		instance_create_layer(x, y + dirtYSpawnDiff, "Instances", obj_dirt_patch_powerup_saw);
		dirtSpawnCnt = 0;
	}
	image_angle -= dir * dirtYSpawnDiff;
}
