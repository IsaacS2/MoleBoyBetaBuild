/// @description Add dirt patches and adjust background speed!

//
// background speed altered
//
if (global.speedChange) {
	layer_vspeed(lay_id, -floor(obstacleSpeed / slowDown));
	global.speedChange = false;
}


//
// dirt spawning altered
//
if (dirtSlowCnt >= slowDown) {
	dirtSpawnCnt = (dirtSpawnCnt + 1) % dirtSpawnVal;
}
// Code below results in dirt patches being spawned every other frame when slow-down occurs,
// since dirt will not spawn when dirtSlowCnt is 1 while slowDown is 2.
if dirtSlowCnt == 1 {
	dirtSlowCnt = 2;
} else {
	dirtSlowCnt = 1;
}
