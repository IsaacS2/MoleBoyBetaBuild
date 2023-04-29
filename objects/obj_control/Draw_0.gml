/// @description Draw dirt!

if (!obj_mole_boy.drilling && !obj_mole_boy.returning) {  // default Mole Boy y-location
	i = dirtSpawnCnt * 8;
	while (i <= maxDirtDistance) {
		draw_sprite(spr_dirt_space, 3, obj_mole_boy.x, obj_mole_boy.y - i );
		i += floor (maxDirtDistance / 2);
	}
} else if (obj_mole_boy.drilling && !obj_mole_boy.stalling) {  // down-drill attack
	draw_sprite(spr_dirt_space_drilling, 0, obj_mole_boy.x, obj_mole_boy.y);
} else if (obj_mole_boy.stalling) {  // in the middle of the screen
	draw_sprite(spr_dirt_space_stalling, 0, obj_mole_boy.x, obj_mole_boy.y);
} else {  // Mole Boy returning to top of screen
	draw_sprite(spr_dirt_space_full, 0, obj_mole_boy.x, obj_mole_boy.y);
}
