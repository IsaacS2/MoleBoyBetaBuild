/// @description Have worm move!
if (global.gamePaused) {
	exit;
}

func_worm_movement(right);

if (y < yDelete) {
	instance_destroy();
}