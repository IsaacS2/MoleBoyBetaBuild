// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_reset_room(){
	global.speedChange = false;
	global.insideRockSlowDown = outsideRockSpeed;
	global.currentExcavationSpeed = 1;
	global.layerSpeed = floor(startingLayerSpeed * global.currentExcavationSpeed);
	layer_vspeed(obj_control.lay_id, -global.layerSpeed);
	room_restart();
	//global.speedChange = true;
}