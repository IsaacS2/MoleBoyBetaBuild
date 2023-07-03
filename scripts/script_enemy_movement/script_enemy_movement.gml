// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_question_enemy_movement(_xMovement, _minYMovement, _maxYMovement){
	var randomYBoost = irandom_range(_minYMovement, _maxYMovement);
	var yMultiple = 3;
	x += _xMovement;
	y -= randomYBoost;
	
	image_angle = (randomYBoost * yMultiple) - (yMultiple * 2);
}