/// @description Draw Mole Boy and drill residue!
function func_mole_boy_sprite() {
	if (sprite_index == normalSprite) {
		draw_sprite_ext(bottomDrillSprite, -1, x, y, 1, 1, image_angle, c_white, 1);
	}
	draw_self();
	if (sprite_index == normalSprite) {
		draw_sprite_ext(topDrillSprite, -1, x, y, 1, 1, image_angle, c_white, 1);
	}
}