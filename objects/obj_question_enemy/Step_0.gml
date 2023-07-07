/// @description question enemy movement/deletion!
if (global.gamePaused) {
	exit;
}

func_question_enemy_movement(currRight, minYSpeed, maxYSpeed);


if (y < yDelete || x < -xDelete || x > room_width + xDelete) {
	instance_destroy();
}
