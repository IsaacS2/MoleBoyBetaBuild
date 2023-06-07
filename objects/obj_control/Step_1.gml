/// @description global.currentExcavationSpeed and others!

//
// add to money total!
//
if (global.newWinnings > 0) {
	global.newWinnings--;
	global.currentExcavationWinnings++;  // newWinnings values slowly added to moneyTotal
}

//
// game speed increased!
//
if (global.speedChange) {
	global.scoreIncrementVal = 0.25 * global.currentExcavationSpeed;
	rockIncVal = 1 * global.currentExcavationSpeed;
	sawIncVal = 1 * global.currentExcavationSpeed;
	wormIncVal = 1 * global.currentExcavationSpeed;
	// to prevent division by zero when speed is incredibly high
	maxExclusiveDirtYMultiple = max(floor (10 / global.currentExcavationSpeed), 1);
	maxDirtYDiff = floor (96 * global.currentExcavationSpeed);
}
