/// @description Draw dirt!

// if neutral or in a rock
if (!obj_mole_boy.drilling && !obj_mole_boy.returning) {  // default Mole Boy y-location
	i = dirtSpawnCnt * 8;  // simulates movement by using dirtSpawnCnt to determine where dirt sprites are
	while (i <= maxDirtDistance) {  // will draw dirt starting from highest y-value
		draw_sprite(spr_dirt_space, 3, obj_mole_boy.x, obj_mole_boy.y - i );
		i += floor (maxDirtDistance / 2);  // max of 2 dirt patches will be drawn
	}
} else if (obj_mole_boy.drilling && !obj_mole_boy.stalling) {  // down-drill attack
	draw_sprite(spr_dirt_space_drilling, 0, obj_mole_boy.x, obj_mole_boy.y);
} else if (obj_mole_boy.stalling) {  // in the middle of the screen while down-drilling
	draw_sprite(spr_dirt_space_stalling, 0, obj_mole_boy.x, obj_mole_boy.y);
} else {  // Mole Boy returning to top of screen (vulnerable state)
	draw_sprite(spr_dirt_space_full, 0, obj_mole_boy.x, obj_mole_boy.y);
}
