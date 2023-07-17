/// @description Increment turning counter!
if (global.gamePaused) {
	exit;
}

if (!spinning) {
	spinTimeCnt += floor(spinTimeIncVal * global.currentExcavationSpeed);
}

if (escaping) {
	var _escapeInc = floor(escapeIncVal * global.currentExcavationSpeed);
	escapeWarpTimeCnt +=_escapeInc;
	escapeEndTimeCnt += _escapeInc;
}

if (spinTimeCnt >= spinTimeLimit) {
	spinTimeCnt = 0;
	spinning = true;
	spinXPoint = x;
	spinYPoint = y + spinDistance;
}
