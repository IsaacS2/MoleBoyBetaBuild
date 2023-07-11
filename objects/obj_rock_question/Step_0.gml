/// @description Question rock movement and stuff
if (global.gamePaused) {
	exit;
}

//func_static_obstacle_movement(floor(global.layerSpeed / global.rockSlowDown));
if (instance_exists(obj_question_enemy)) {	
	x = instance_nearest(x, y, obj_question_enemy).x;
	y = instance_nearest(x, y, obj_question_enemy).y;
} 
else {
	instance_destroy();
}
if (y < yDelete) {
	instance_destroy();
}