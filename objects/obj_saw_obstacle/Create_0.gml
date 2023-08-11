/// @description Obstacle stats!
//
// Game By Isaac Sanchez
// Started Summer 2022
//

//
// values for calculating speed
//
yStart = room_height + 96;
yDelete = -66;  // -160 for big rock use
image_speed = 0;
moleInside = false;

y = yStart;

if (instance_exists(obj_saw_sound_manager)) {
	obj_saw_sound_manager.y = y;
}
else {
	instance_create_layer(x, yStart, "Instances", obj_saw_sound_manager);
}

global.sawSound = func_obstacle_saw_sound();