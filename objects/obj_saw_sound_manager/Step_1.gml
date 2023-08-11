/// @description Adjust Sound
if (global.gamePaused) {
	exit;
}

if (!instance_exists(obj_saw_obstacle)) {
	instance_destroy();
	exit;
}

if (y > moleYValueStart) {
	audio_sound_gain(global.sawSound, max(.4, (moleYValueStart / y)), 0);
}
else if (y > 0) {
	audio_sound_gain(global.sawSound, (y / moleYValueStart), 0);
}