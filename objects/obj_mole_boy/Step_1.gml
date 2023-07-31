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
keyPower = keyboard_check_pressed(ord("C")) || keyboard_check_pressed(ord("P"));

if (global.gamePaused) {
	if (global.dead || global.powerupActivated) {
		state(beginStepVal);
	}
	exit;
}
//
// Second, update variables due to game speed up or mole boy speed up
//
if (global.speedChange) {  // game speed updated
	wormDecrementTime = round(originalWormDecrementTime / global.currentExcavationSpeed);
}
if (global.moleBoySpeedChange) {  // Mole Boy speed updated
	movement = round(baseMovement * global.currentMoleBoySpeed);  // Increase base movement
	directionIncVal = round(baseDirectionIncVal * global.currentMoleBoySpeed);  // Increase traction movement
	noInputIncVal = round(baseNoInputIncVal * global.currentMoleBoySpeed);  // Increase rate MB stops moving without input
	maxMomentum = round(baseMaxMomentum * global.currentMoleBoySpeed) * slip;
	normalMovement = movement;
	endStall = ceil(baseEndStall / global.currentMoleBoySpeed);  // decrease amount of time MB is in the middle of the screen during his drill attack
	global.moleBoySpeedChange = false;
}

//
// Third, perform state actions
//
currStep = beginStepVal;
state(currStep);