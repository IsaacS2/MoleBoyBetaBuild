/// @description Draw Mole Boy and drill residue!
function func_mole_boy_sprite() {
	if (powerActCnt >= 1) {
		draw_sprite(spr_powerup_activated, currPowerupIndex, x, y + 32);
		if (currPowerupIndex < powerupActAnimationLength - 1) {
			currPowerupIndex++;
		}
	}
	
	if (instance_exists(obj_powerup_saw_left)) {
		if (!obj_powerup_saw_left.falling) {
			draw_line_width(x, y + centerYDiff, obj_powerup_saw_left.x, obj_powerup_saw_left.y, 2);
		}
	}
	if (instance_exists(obj_powerup_saw_right)) {
		if (!obj_powerup_saw_right.falling) {
			draw_line_width(x, y + centerYDiff, obj_powerup_saw_right.x, obj_powerup_saw_right.y, 2);
		}
	}
	if (currentSprite == normalSprite) {
		draw_sprite_ext(bottomDrillSprite, -1, x, y, 1, 1, image_angle, c_white, 1);
	}
	draw_sprite_ext(currentSprite, -1, x, y, 1, 1, image_angle, c_white, 1);
	if (currentSprite == normalSprite) {
		draw_sprite_ext(topDrillSprite, -1, x, y, 1, 1, image_angle, c_white, 1);
	}
}

function func_question_enemy_sprite() {
	draw_sprite_ext(currentSprite, -1, x, y, currRight, 1, spinAngle - spinStartAngle, c_white, escapeAlpha);
	//draw_sprite_ext(earSprite, -1, x, y, currRight, 1, 0, c_white, escapeAlpha);
	//draw_sprite_ext(armSprite, -1, x, y, currRight, 1, 0, c_white, escapeAlpha);
	//draw_sprite_ext(legSprite, -1, x, y, currRight, 1, 0, c_white, escapeAlpha);
}