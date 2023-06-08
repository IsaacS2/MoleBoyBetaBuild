/// @description SpeedUp values
if (global.gamePaused) {
	exit;
}
//
// Time to speed up obstacles!
//
if (global.speedChange) {
	yMovement = floor(startingLayerSpeed * global.currentExcavationSpeed);
}