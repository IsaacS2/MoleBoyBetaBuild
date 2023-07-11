/// @description Question rock stats!
//
// Game By Isaac Sanchez
// Started Summer 2022
//

//
// values for calculating speed
//
//yStart = room_height + 66;
yDelete = -80;
depth = -2;
right = true;
if (instance_exists(obj_question_enemy)) {
	if (instance_nearest(x, y, obj_question_enemy).currRight == -1) {
		image_xscale = -1;
		right = false;
	}
}

//y = yStart;