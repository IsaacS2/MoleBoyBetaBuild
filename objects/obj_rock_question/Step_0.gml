/// @description Question rock movement and stuff
if (global.gamePaused) {
	exit;
}

//func_static_obstacle_movement(floor(global.layerSpeed / global.rockSlowDown));
x = obj_question_enemy.x;
y = obj_question_enemy.y;

if (y < yDelete) {
	instance_destroy();
}