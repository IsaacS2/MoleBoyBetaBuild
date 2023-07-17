/// @description question enemy movement/deletion!
if (global.gamePaused) {
	exit;
}

if (spinning) {
	func_question_enemy_turn();
}
else if (escaping) {
	y -= floor(global.currentExcavationSpeed);
	
	if (escapeWarpTimeCnt >= escapeWarpTimeLimit) {
		escapeWarpTimeCnt = -escapeEndTimeLimit;
		x += escapeDistance;
		y += abs(escapeDistance);
	}
	else if (escapeEndTimeCnt >= escapeEndTimeLimit) {
		escapeWarpTimeCnt = 0;
		escapeEndTimeCnt = 0;
		escaping = false;
	}
}
else {
	func_question_enemy_movement(currRight, ySpeed * global.currentExcavationSpeed);
}

if (y < yDelete || x < -xDelete || x > room_width + xDelete) {
	instance_destroy();
}
