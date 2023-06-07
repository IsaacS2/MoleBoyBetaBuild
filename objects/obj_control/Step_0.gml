/// @description Add dirt patches and adjust background speed!

//
// speed change complete
//
if (global.speedChange) {
	global.speedChange = false;
}

//
// dirt spawning altered
//
if (dirtSpawnDeterminant >= global.rockSlowDown) {
	currDirtYMultiple = (currDirtYMultiple + 1) % maxExclusiveDirtYMultiple;
}
// Code below results in dirt patches being spawned every other frame when slow-down occurs,
// since dirt will not spawn when dirtSpawnDeterminant is outsideRockSpeed while global.rockSlowDown is insideRockSpeed.
if dirtSpawnDeterminant == 1 {
	dirtSpawnDeterminant = 2;
} else {
	dirtSpawnDeterminant = 1;
}
