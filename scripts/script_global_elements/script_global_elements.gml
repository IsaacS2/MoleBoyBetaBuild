#macro outsideRockSpeed 1
#macro insideRockSpeed 2
#macro excavationSpeedIncrementVal 0.5
#macro startingLayerSpeed 9

//
// global variables
//
// Global variable pause mechanic from https://www.youtube.com/watch?v=JwWuZXyTzN0&t=1426s
//
global.gamePaused = false;
global.speedChange = false;
global.rockSlowDown = outsideRockSpeed;
global.currentExcavationSpeed = 1;
global.layerSpeed = floor(startingLayerSpeed * global.currentExcavationSpeed);

function func_reset_excavation(){
	global.speedChange = false;
	global.rockSlowDown = outsideRockSpeed;
	global.currentExcavationSpeed = 1;
	//global.layerSpeed = floor(startingLayerSpeed * global.currentExcavationSpeed);
	room_restart();
}