/// @description Draw dirt!
with (obj_mole_boy) {
	switch (state) {
		// if neutral or in a rock
		case (func_neutral_state):  // default Mole Boy y-location
			i = obj_control.currDirtYMultiple * 8;  // simulates movement by using currDirtYMultiple to determine where dirt sprites are
			while (i <= obj_control.maxDirtYDiff) {  // will draw dirt starting from highest y-value
				draw_sprite(spr_dirt_space, 3, obj_mole_boy.x, obj_mole_boy.y - i );
				i += floor (obj_control.maxDirtYDiff / 2);  // max of 2 dirt patches will be drawn
			}
		break;
		
		case (func_drilling_state):  // down-drill attack
			draw_sprite(spr_dirt_space_drilling, 0, obj_mole_boy.x, obj_mole_boy.y);
		break;
		
		case (func_stalling_state):  // in the middle of the screen while down-drilling
			draw_sprite(spr_dirt_space_stalling, 0, obj_mole_boy.x, obj_mole_boy.y);
		break;
		
		case (func_returning_state):  // Mole Boy returning to top of screen (vulnerable state)
			draw_sprite(spr_dirt_space_full, 0, obj_mole_boy.x, obj_mole_boy.y);
		break;
	}
}