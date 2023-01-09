/// @description SpeedUp and others!

//
// add to money total!
//
if (currWinnings > 0) {
	currWinnings--;
	moneyVal++;
}


if (speedChange == 1) {
	scoreMultiplier = 0.25 * speedUp;
	rockInc = 1 * speedUp;
	sawInc = 1 * speedUp;
	wormInc = 1 * speedUp;
	dirtSpawnVal = floor (10 / speedUp);
	maxDirtDistance = floor (96 * speedUp);
	obstacleSpeed = floor(9 * speedUp);
}
