/// Moving dead enemy!
if (global.gamePaused) {
	exit;
}

if (image_index >= image_number - 1 && !falling) {
	falling = true;
	vspd -= yMovement;
	y += ySpinningStartDiff;
	sprite_index = deathSpinningSprite;
}
else if (falling) {
	func_move_dead_enemy();
}

if (!falling && instance_exists(obj_mole_boy)) {
	x = obj_mole_boy.x;
	y = obj_mole_boy.y;
	image_angle = obj_mole_boy.image_angle;
}

if (y < yDelete || x < -xDelete || x > room_width + xDelete) {
	instance_destroy();
}