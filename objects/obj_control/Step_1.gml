/// @description global.currentExcavationSpeed and others!

//
// add to money total!
//
if (currWinnings > 0) {
	currWinnings--;
	moneyTotal++;  // finally, currWinnings values slowly added to moneyTotal
}

//
// game speed increased!
//
if (global.speedChange) {
	scoreMultiplier = 0.25 * global.currentExcavationSpeed;
	rockInc = 1 * global.currentExcavationSpeed;
	sawInc = 1 * global.currentExcavationSpeed;
	wormInc = 1 * global.currentExcavationSpeed;
	// to prevent division by zero when speed is incredibly high
	dirtSpawnVal = max(floor (10 / global.currentExcavationSpeed), 1);
	maxDirtDistance = floor (96 * global.currentExcavationSpeed);
}
