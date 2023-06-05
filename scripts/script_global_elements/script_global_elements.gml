#macro outsideRockSpeed 1
#macro insideRockSpeed 2
#macro excavationSpeedIncrementVal 0.5
#macro moleBoySpeedIncrementVal 0.5
#macro baseScoreIncrementVal 0.25
#macro startingLayerSpeed 9
#macro beginStepVal 0
#macro stepVal 1
#macro endStepVal 2

//
// global variables
//
// Global variable pause mechanic from https://www.youtube.com/watch?v=JwWuZXyTzN0&t=1426s
//
global.gamePaused = false;
global.speedChange = false;
global.moleBoySpeedChange = false;
global.rockSlowDown = outsideRockSpeed;
global.currentExcavationSpeed = 1;
global.currentMoleBoySpeed = 1;
global.layerSpeed = floor(startingLayerSpeed);
global.currentDepth = 0;
global.currentExcavationWinnings = 0;
global.newWinnings = 0;
global.scoreIncrementVal = baseScoreIncrementVal * global.currentExcavationSpeed;

function func_initialize_globals() {
	global.gamePaused = false;
	global.speedChange = false;
	global.moleBoySpeedChange = false;
	global.rockSlowDown = outsideRockSpeed;
	global.currentExcavationSpeed = 1;
	global.currentMoleBoySpeed = 1;
	global.layerSpeed = floor(startingLayerSpeed);
	global.currentDepth = 0;
	global.currentExcavationWinnings = 0;
	global.newWinnings = 0;
	global.scoreIncrementVal = baseScoreIncrementVal * global.currentExcavationSpeed;
}

function func_reset_excavation() {
	room_restart();
}