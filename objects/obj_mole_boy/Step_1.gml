/// @description Character Movement

// Should drilling be influenced by direction?
// ...
// YES, but only by a little (at the start, at least)


//
// First, update variables due to speed up or mole boy speed up
//
if (newGameSpeed < obj_control.speedUp) {
	wormDecreaseTime = round(15 / obj_control.speedUp);
	newGameSpeed = obj_control.speedUp;
}
if (newMoleSpeed < obj_control.moleBoySpeed) {
	movement = round(2 * obj_control.moleBoySpeed);
	directionInc = round(2 * obj_control.moleBoySpeed);
	noInputInc = round(1 * obj_control.moleBoySpeed);
	maxMomentum = round(6 * obj_control.moleBoySpeed) * slip;
	currMovement = movement;
	endStall = ceil (5 / obj_control.moleBoySpeed);
	newMoleSpeed = obj_control.moleBoySpeed;
}

//
// Now, input needs to be registered for down drill and power-up
//
if (keyboard_check(vk_space) && canDrill) { // Drilling time!
	image_angle = 0;
	drilling = true;
	sprite_index = spr_mole_boy_drilling_red;
	right = 0; // no more x movement or momentum
	momentum = 0;
	canDrill = false;
	while (place_meeting(x, y, obj_rock_obstacle)) {
		rock = instance_nearest(x, y, obj_rock_obstacle)
		instance_create_depth(rock.x, rock.y, 0, obj_rock_broken);
		instance_destroy(instance_nearest(x, y, obj_rock_obstacle));
		moleCurrCash += rockCash;
	}
}


//
// TODO: Power-up mechanics
//


//
// Next, have main character move (down-drill attack first)
//

// for bringing Mole Boy back to top of screen after drill attack
if (drillStallCnt >= endStall) {
	stalling = false;
	drilling = false; // Mole Boy is vulnerable
	drillCnt = 0;
	drillStallCnt = 0;
	returning = true;
	sprite_index = spr_mole_boy;
}
if (returning) {
	y -= returnY; // Mole Boy moving back to top of the screen
	if (y <= startY) {  // object height / 2; top of screen
		y = startY;
		returning = false;
		canDrill = true; // back to status quo
	}
}

// for actual drill attack
if (drilling && drillCnt < endDrill) {
	y += drillY; // Mole Boy's drilling downwards
	drillCnt++;
} else if (drillCnt >= endDrill && drillStallCnt < endStall) {
	stalling = true;
}
if stalling {
	drillStallCnt++; // keeps Mole Boy at max attack depth for a few steps
}


//
// x-movement code
//
// Conditions for when moving right, left or not at all. These will be calculated
// when Mole Boy is not drilling, as drilling will set momentum to zero and stop
//  Mole Boy's x movement altogether.
//

// moving right (and not holding left)
if (keyboard_check(vk_right) && !keyboard_check(vk_left) && !drilling) {
	right = 1; // confirms player direction held
	if (momentum < maxMomentum && !inRock) { // momentum can be grown
		momentum = min((momentum + directionInc), maxMomentum); // don't want anything above maxMomentum
	}
	//
	// In case momentum is larger and opposite than movement value, the sign of the
	// sum will be used to determine when Mole Boy is moving and what collisions to
	// watch out for. 
	//
	// image is rotated slighty to enhance feeling of movement
	image_angle = momentum * 2;
	func_movement(obj_mole_boy, sign(movement + momentum), abs(movement + momentum));
}
// moving left (and not holding right)
else if (!keyboard_check(vk_right) && keyboard_check(vk_left) && !drilling) {
	right = -1;
	if (momentum > -maxMomentum && !inRock) { // momentum can be lower (as in influencing left mvmt)
		// don't want anything below -maxMomentum (or minimum momentum, in this case)
		momentum = max((momentum - directionInc), -maxMomentum);
	}
	image_angle = momentum * 2;
	func_movement(obj_mole_boy, sign(-movement + momentum), abs(-movement + momentum));
} 
// not moving (emulates momentum to controls by SLOWLY stopping Mole Boy when
// there's no input and a direction was held previously)
else if ((keyboard_check(vk_left) == keyboard_check(vk_right)) 
		&& !drilling && !inRock) {
	right = 0;
	if (momentum > 0) { // leftover momentum from right movement
		momentum = max((momentum - noInputInc), 0); // don't want to go below zero
		image_angle = momentum * 2;
		func_movement(obj_mole_boy, sign(momentum), abs(momentum)); // only momentum alters x
	}
	else if (momentum < 0) { // leftover momentum from left movement
		momentum = min((momentum + noInputInc), 0); // don't want to go above zero
		image_angle = momentum * 2;
		func_movement(obj_mole_boy, sign(momentum), abs(momentum));
	}
}
