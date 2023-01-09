/// @description Draw dirt!

if (!obj_mole_boy.drilling && !obj_mole_boy.returning) {
	i = dirtSpawnCnt * 8;
	while (i <= maxDirtDistance) {
		draw_sprite(spr_dirt_space, 3, obj_mole_boy.x, obj_mole_boy.y - i );
		i += floor (maxDirtDistance / 2);
	}
	//draw_sprite(spr_dirt_space, 3, obj_mole_boy.x, obj_mole_boy.y - (dirtSpawnCnt * 8) );
	//draw_sprite(spr_dirt_space, 3, obj_mole_boy.x, obj_mole_boy.y - ( (dirtSpawnCnt * 8) - (dirtSpawnCnt * 4) ) );
} else if (obj_mole_boy.drilling && !obj_mole_boy.stalling) {
	draw_sprite(spr_dirt_space_drilling, 0, obj_mole_boy.x, obj_mole_boy.y);
} else if (obj_mole_boy.stalling) {
	draw_sprite(spr_dirt_space_stalling, 0, obj_mole_boy.x, obj_mole_boy.y);
} else {
	draw_sprite(spr_dirt_space_full, 0, obj_mole_boy.x, obj_mole_boy.y);
}
