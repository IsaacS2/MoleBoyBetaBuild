/// @description Enemy/obstacle collision, worm meter depletion


//
// worm collision
//
if (place_meeting(x, y, obj_worm)) {
	right = instance_nearest(x, y, obj_worm).right;
	instance_destroy(instance_nearest(x, y, obj_worm));
	eatenWorm = instance_create_depth(x, y + 32, -6, obj_worm_eaten);
	eatenWorm.image_xscale = -right;
	// min function keeps bar from overflowing
	wormMeterVal = min(wormMeterMax, wormMeterVal + wormEatenBoost);  // Delicious worm!
}

//
// saw collision
//
if (place_meeting(x, y, obj_saw_obstacle)) {
	func_reset_excavation();
}

//
// currStep = endStepVal;
//
// state(currStep);
//

//
// rock collision
//
// The status "destroyed" for regular rocks is checked to set destroyed
// status to "true" so that rocks can play a shattering animation before
// being destroyed.
//
// NOTE: outer if-statement could be added to !inRock else-if-statement for possibly better performance
//
if ( place_meeting(x, y, obj_rock_obstacle) || place_meeting(x, y, obj_big_rock_obstacle) ) {
	if (drilling) {  // "destroy" rock
		while (place_meeting(x, y, obj_rock_obstacle)) {  // in case multiple rocks are destroyed
			rock = instance_nearest(x, y, obj_rock_obstacle)
			instance_create_depth(rock.x, rock.y, 0, obj_rock_broken);
			instance_destroy(instance_nearest(x, y, obj_rock_obstacle));
			global.newWinnings += rockCash;  //cash added to global.newWinnings
		}
		if (place_meeting(x, y, obj_big_rock_obstacle)) {
			instance_destroy(instance_nearest(x, y, obj_big_rock_obstacle));
		}
	} else if (!inRock) {  // digging through rock slowly
		sprite_set_speed(sprite_index, 30, spritespeed_framespersecond);
		inRock = true;
		momentum = 0;
		image_angle = 0;
		movement = floor (movement / 2);
		global.rockSlowDown = insideRockSpeed;
		// For altering background speed
		layer_vspeed(obj_control.lay_id, -floor(global.layerSpeed / global.rockSlowDown));
	}
} 
//
// Now must check if mole is out of rock to revert speed to normal.
//
if (inRock && !place_meeting(x, y, obj_rock_obstacle) 
	&& !place_meeting(x, y, obj_big_rock_obstacle) ) {
	inRock = false;
	sprite_set_speed(sprite_index, 60, spritespeed_framespersecond);
	movement = currMovement;
	global.rockSlowDown = outsideRockSpeed;
	// For returning background speed to normal
	layer_vspeed(obj_control.lay_id, -floor(global.layerSpeed / global.rockSlowDown));
}


//
// Time to add to depth
//
global.currentDepth += (global.scoreIncrementVal / global.rockSlowDown);

//
// Time to calculate worm count
//
wormDecreaseCnt += global.rockSlowDown;  // for rock collision worm meter penalty
// removing from worm meter
if (wormDecreaseCnt >= wormDecreaseTime) {
	wormDecreaseCnt = 0;
	wormMeterVal -= wormDepletion;
	if (wormMeterVal <= 0) {
		func_reset_excavation();  // DEATH
	}
}
