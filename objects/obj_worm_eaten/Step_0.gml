/// @description Move/destroy worm!
if (global.gamePaused) {
	exit;
}

x = obj_mole_boy.x;
y = obj_mole_boy.y + 32;

if (image_index >= image_number - 1) {
	instance_destroy();
}
