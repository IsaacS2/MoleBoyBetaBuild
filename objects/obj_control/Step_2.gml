/// @description Spawn rocks and stuff!
rockCnt += rockInc / slowDown;

// rock will be spawned down now
if (rockCnt >= rockSpawner) {
	instance_create_depth(rockLocation, room_height + 48, 1, obj_rock_obstacle);
	rockCnt = 0;
	rockSpawner = irandom_range(minRockTimer, maxRockTimer);
	// randomize rock timing again
	rockLocation = irandom_range(minRockX, maxRockX);
	// randomize next rock x-value location again
}

if (keyboard_check_pressed(ord("R"))) {
	room_restart();
}


//
// spawn saws!
//
sawCnt += sawInc / slowDown;

// saw will be spawned down now
if (sawCnt >= sawSpawner) {
	instance_create_depth(sawLocation, room_height + 48, 0, obj_saw_obstacle);
	sawCnt = 0;
	sawSpawner = irandom_range(minSawTimer, maxSawTimer);
	// randomize saw timing again
	sawLocation = irandom_range(minSawX, maxSawX);
	// randomize next saw x-value location again 
}


//
// spawn worms!
//
wormCnt += wormInc / slowDown;

// worm will be spawned down now
if (wormCnt >= wormSpawner) {
	newWorm = instance_create_depth(wormLocation, room_height + 48, 0, obj_worm);
	if (wormLocation >= (room_width / 2) ) {
		newWorm.right = -1;
	} else {
		newWorm.right = 1;
	}
	//
	// Thanks to Gurpreet Singh Matharoo for image-flipping info at 
	// https://gamemakerhow.com/how-to-flip-an-instance-sprite/
	//
	newWorm.image_xscale = -newWorm.right;
	wormCnt = 0;
	wormSpawner = irandom_range(minWormTimer, maxWormTimer);
	// randomize worm timing again
	wormLocation = irandom_range(minWormX, maxWormX);
	// randomize next worm x-value location again 
}

if (keyboard_check_pressed(ord("G"))) {
	speedUp += 0.5;
	speedChange = 1;
}

if (keyboard_check_pressed(ord("M"))) {
	moleBoySpeed += 0.5;
}