/// @description Move to excavation room
// Thanks to Shaun Spalding for initialization room idea,
// from "GameMaker - Pause Menu Tutorial (Method 1)"
// https://www.youtube.com/watch?v=pXvRcPObUbU
//
view_enabled = true;
view_visible[0] = true;

if (room == rm_init) {
	func_load_game();
	room_goto_next();
}