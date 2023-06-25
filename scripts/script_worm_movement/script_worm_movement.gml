// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_worm_movement(_right){
	wormSideSpeed = 2;
	wormUpSpeed = 3;
	x += floor(_right * global.currentExcavationSpeed * wormSideSpeed);
	y -= floor( (global.currentExcavationSpeed * wormUpSpeed) / global.rockSlowDown );
}