if (!global.gamePaused) {
	/// @description Spawn rocks and stuff!
	rockCnt += rockIncVal / global.rockSlowDown;

	// rock will be spawned down now
	if (rockCnt >= rockSpawnTime) {
		instance_create_depth(rockX, room_height + 48, 1, obj_rock_obstacle);
		rockCnt = 0;
		rockSpawnTime = irandom_range(minRockSpawnTime, maxRockSpawnTime);
		// randomize rock timing again
		rockX = irandom_range(minRockX, maxRockX);
		// randomize next rock x-value location again
	}

	if (keyboard_check_pressed(ord("R"))) {
		func_reset_excavation();
	}

	//
	// spawn saws!
	//
	sawCnt += sawIncVal / global.rockSlowDown;

	// saw will be spawned down now
	if (sawCnt >= sawSpawnTime) {
		instance_create_depth(sawX, room_height + 48, 0, obj_saw_obstacle);
		sawCnt = 0;
		sawSpawnTime = irandom_range(minSawSpawnTime, maxSawSpawnTime);
		// randomize saw timing again
		sawX = irandom_range(minSawX, maxSawX);
		// randomize next saw x-value location again 
	}


	//
	// spawn worms!
	//
	wormCnt += wormIncVal / global.rockSlowDown;

	// worm will be spawned down now
	if (wormCnt >= wormSpawnTime) {
		newWorm = instance_create_depth(wormX, room_height + 48, 0, obj_worm);
		if (wormX >= (room_width / 2) ) {
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
		wormSpawnTime = irandom_range(minWormSpawnTime, maxWormSpawnTime);
		// randomize worm timing again
		wormX = irandom_range(minWormX, maxWormX);
		// randomize next worm x-value location again 
	}

	if (keyboard_check_pressed(ord("G"))) {
		global.currentExcavationSpeed += 0.5;
		global.layerSpeed = floor(startingLayerSpeed * global.currentExcavationSpeed);
		layer_vspeed(lay_id, -floor(global.layerSpeed / global.rockSlowDown));
		global.speedChange = true;
	}

	if (keyboard_check_pressed(ord("M"))) {
		global.currentMoleBoySpeed += 0.5;
		global.moleBoySpeedChange = true;
	}
}


// Thanks to Shaun Spalding for game pausing explanation from
// "GameMaker Studio 2: Action RPG Tutorial (Part 5: Initialisation/Pausing)"
// Youtube video: https://www.youtube.com/watch?v=JwWuZXyTzN0&t=1s
if (keyboard_check_pressed(vk_escape)) {
	global.gamePaused = !global.gamePaused;
	
	if (global.gamePaused) {
		with (all) {
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
			layer_vspeed(obj_control.lay_id, 0);
		}
	}
	else {
		with (all) {
			image_speed = gamePausedImageSpeed;
			layer_vspeed(obj_control.lay_id, -floor(global.layerSpeed / global.rockSlowDown));
		}
	}
}