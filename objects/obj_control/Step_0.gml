/// @description Add dirt patches and adjust background speed!

//
// background speed altered
//
if (speedChange == 1) {
	layer_vspeed(lay_id, -floor(obstacleSpeed / slowDown));
	speedChange = 0;
}


//
// dirt spawning altered
//
if (dirtSlowCnt >= slowDown) {
	dirtSpawnCnt = (dirtSpawnCnt + 1) % dirtSpawnVal;
}
// Code below results in no dirt patches being spawned when slowDown occurs
if dirtSlowCnt == 1 {
	dirtSlowCnt = 2;
} else {
	dirtSlowCnt = 1;
}
