/// @description Character Movement

// Should drilling be influenced by direction?
// ...
// YES, but only by a little (at the start, at least)

//
// First, register all input from the player that's tied to Mole Boy's Actions
//
keyRight = keyboard_check(vk_right);
keyLeft = keyboard_check(vk_left);
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keyAttack = keyboard_check(vk_space);
keyPower = keyboard_check(ord("C"));

//
// Second, update variables due to game speed up or mole boy speed up
//
if (global.speedChange) {  // game speed updated
	wormDecreaseTime = round(originalWormDecreaseTime / global.currentExcavationSpeed);
}
if (global.moleBoySpeedChange) {  // Mole Boy speed updated
	movement = round(2 * global.currentMoleBoySpeed);  // Increase base movement
	directionIncVal = round(2 * global.currentMoleBoySpeed);  // Increase traction movement
	noInputIncVal = round(1 * global.currentMoleBoySpeed);  // Increase rate MB stops moving without input
	maxMomentum = round(6 * global.currentMoleBoySpeed) * slip;
	normalMovement = movement;
	endStall = ceil(5 / global.currentMoleBoySpeed);  // decrease amount of time MB is in the middle of the screen during his drill attack
	global.moleBoySpeedChange = false;
}


currStep = beginStepVal;
state(currStep);




//
// Now, input needs to be checked for down drill and power-up
//

/*
if (keyAttack && canDrill) { // Drilling time!
	func_switchTo_drilling();
	func_destroy_rocks();
}


//
// TODO: Power-up mechanics
//


//
// Next, have main character move (down-drill attack first)
//
// for bringing Mole Boy back to top of screen after drill attack
if (drillStallCnt >= endStall) {
	func_switchTo_returning();
}
if (returning) {
	func_switchFrom_returning_and_yMovement();
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
// Mole Boy's x movement altogether.
//
// moving right (and not holding left)
if (keyRight && !keyLeft && !drilling) {
	func_right_movement();
}
// moving left (and not holding right)
else if (!keyRight && keyLeft && !drilling) {
	func_left_movement();
} 
// not moving (simulates momentum in controls by SLOWLY stopping Mole Boy when
// there's no input and a direction was held previously)
else if ( (keyLeft == keyRight) && !drilling && (global.rockSlowDown & outsideRockSpeed)) {
	func_momentumOnly_movement();
}
*/