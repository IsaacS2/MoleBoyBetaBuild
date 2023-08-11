// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_stop_sound(_sound) {
	audio_stop_sound(_sound);
}

function func_mole_restart_normal_drilling_sound() {
	audio_stop_sound(snd_in_rock_drill);
	audio_play_sound(snd_regular_drill, 5, true);
}

function func_mole_drill_attack_sound() {
	audio_play_sound(snd_down_drill, 7, false);
}

function func_mole_stop_normal_drilling_sound() {
	func_stop_sound(snd_regular_drill);
}

function func_mole_restart_in_rock_sound() {
	func_mole_stop_normal_drilling_sound();
	audio_stop_sound(snd_in_rock_drill);
	audio_play_sound(snd_in_rock_drill, 5, true);
}

function func_rock_destroy_sound() {
	func_stop_sound(snd_rock_destroy);
	audio_play_sound(snd_rock_destroy, 3, false);
}

function func_obstacle_saw_sound() {
	func_stop_sound(snd_obstacle_saw);
	return audio_play_sound(snd_obstacle_saw, 8, true);
}

function func_squeak_sound() {
	audio_play_sound(snd_squeak, 5, false);
}

function func_beep_sound() {
	audio_play_sound(snd_beep, 8, true);
}

function func_mole_stop_all_sounds() {
	func_mole_stop_normal_drilling_sound();
	func_stop_sound(snd_down_drill);
	func_stop_sound(snd_in_rock_drill);
	func_stop_sound(snd_rock_destroy);
	func_stop_sound(snd_obstacle_saw);
	func_stop_sound(snd_beep);
}

