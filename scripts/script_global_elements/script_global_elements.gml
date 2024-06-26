#macro outsideRockSpeed 1
#macro insideRockSpeed 2
#macro excavationSpeedIncrementVal 0.5
#macro moleBoySpeedIncrementVal 0.5
#macro baseScoreIncrementVal 0.25
#macro startingLayerSpeed 9
#macro beginStepVal 0
#macro stepVal 1
#macro endStepVal 2
#macro moleYValueStart round(room_height / 10)
#macro obstacleSawRadius 128

//
// global variables
//
// Global variable pause mechanic from https://www.youtube.com/watch?v=JwWuZXyTzN0&t=1426s
//
global.gamePaused = false;
global.dead = false;
global.powerActive = false;
global.powerupActivated = false;
global.speedChange = false;
global.moleBoySpeedChange = false;
global.rockSlowDown = outsideRockSpeed;
global.currentExcavationSpeed = 1;
global.currentMoleBoySpeed = 1;
global.layerSpeed = startingLayerSpeed;
global.currentDepth = 0;
global.currentExcavationWinnings = 0;
global.newWinnings = 0;
global.scoreIncrementVal = baseScoreIncrementVal * global.currentExcavationSpeed;
global.bestDepth = 0;
global.totalWinnings = 0;
global.debug = false;
global.sawSound = noone;

function func_initialize_globals() {
	global.gamePaused = false;
	global.dead = false;
	global.powerActive = false;
	global.powerupActivated = false;
	global.speedChange = false;
	global.moleBoySpeedChange = false;
	global.rockSlowDown = outsideRockSpeed;
	global.currentExcavationSpeed = 1;
	global.currentMoleBoySpeed = 1;
	global.layerSpeed = startingLayerSpeed;
	global.currentDepth = 0;
	global.currentExcavationWinnings = 0;
	global.newWinnings = 0;
	global.scoreIncrementVal = baseScoreIncrementVal * global.currentExcavationSpeed;
	global.sawSound = noone;
	sprite_set_speed(spr_mole_boy_no_effects, 60, spritespeed_framespersecond);
}

function func_reset_excavation() {
	audio_stop_all();
	room_restart();
}

//
// Thanks to Shaun Spalding for his game saving explanation from his
// "GameMaker Studio 2 - Best Saving and Loading Tutorial (2.3.1+)"
// Youtube video: https://www.youtube.com/watch?v=R84mR52QaMg
//
function func_save_game() {
	global.totalWinnings += global.currentExcavationWinnings + global.newWinnings;
	global.bestDepth = ceil(max(global.bestDepth, global.currentDepth));
	var _saveData = array_create(0);
	array_push(_saveData, ceil(global.totalWinnings));
	array_push(_saveData, global.bestDepth);
	
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "savedgame.save");
	buffer_delete(_buffer);
	
	show_debug_message("Game saved! " + _string);
}

function func_load_game() {
	if (file_exists("savedgame.save")) {
		var _buffer = buffer_load("savedgame.save");
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
	
		var _loadData = json_parse(_string);
		global.bestDepth = array_pop(_loadData);
		global.totalWinnings = array_pop(_loadData);
	
		show_debug_message("game loaded! " + _string);
	}
}

function func_delete_score() {
	global.currentDepth = 0;
	global.currentExcavationWinnings = 0;
	global.newWinnings = 0;
	global.bestDepth = 0;
	global.totalWinnings = 0;
}

function func_freeze_screen() {
	with (all) {
		gamePausedImageSpeed = image_speed;
		image_speed = 0;
		layer_vspeed(obj_control.lay_id, 0);
	}
}

function func_unfreeze_screen() {
	with (all) {
		image_speed = gamePausedImageSpeed;
		layer_vspeed(obj_control.lay_id, -floor(global.layerSpeed / global.rockSlowDown));
	}
}

function func_initialize_death_screen() {
	func_freeze_screen();
	global.dead = true;
	global.gamePaused = true;
}

function func_initialize_powerup_screen() {
	func_freeze_screen();
	global.powerupActivated = true;
	global.gamePaused = true;
}