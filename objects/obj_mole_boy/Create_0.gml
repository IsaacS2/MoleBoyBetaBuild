/// @description Mole Boy's stats and values!

//
// Game By Isaac Sanchez
// Started Summer 2022
//

//
// method variables for state machine
//
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//
// func_neutral_state
//
// This method performs movement actions and variable changes when Mole Boy
// is in the neutral state (not in a rock, not in the process of acting,
// can move freely).
//
/*
func_neutral_state = function(_step) {
	if (_step == beginStepVal) {
		func_attack_input_movement();
		func_direction_input_movement();
	} 
	else if (_step == endStepVal) {
		if ( place_meeting(x, y, obj_rock_obstacle) || place_meeting(x, y, obj_big_rock_obstacle) ) {
			func_enter_rock();
		}
	}
}


//
// func_drilling_state
//
// This method performs movement actions and variable changes when Mole Boy
// is drilling downwards with fast vertical speed (not stalling or returning
// to the top of the screen).
//
func_drilling_state = function(_step) {
	if (_step == beginStepVal) {
		if (drillCnt < endDrill) {
			y += drillY; // Mole Boy's drilling downwards
			drillCnt++;
		} else if (drillCnt >= endDrill && drillStallCnt < endStall) {
			state = func_stalling_state;
		}
	}
}


//
// func_stalling_state
//
// This method performs movement actions and variable changes when Mole Boy
// is drilling downwards with no vertical speed (stalling).
//
func_stalling_state = function(_step) {
	
}


//
// func_returning_state
//
// This method performs movement actions and variable changes when Mole Boy
// is returning to the top of the screen after a drilling attack.
//
func_returning_state = function(_step) {
	
}


//
// func_in_rock_state
//
// This method performs movement actions and variable changes when Mole Boy
// is in a rock without performing a drill attack (inRock)
//
func_in_rock_state = function(_step) {
	if (_step == beginStepVal) {
		func_attack_input_movement();
		func_direction_input_movement();
	} 
}
*/

slip = 1;  // for diiferent environment changes
movement = 2;
currMovement = movement;  // unchanged variabled that is used to return movement to original value
right = 0;
startY = 96;
powerUp1 = 0;
powerUp2 = 0;
momentum = 0;
directionInc = 2;  // value used to increase/decrease Mole Boy's directional movement with input
noInputInc = 1;  // value used to stop Mole Boy's directional movement without input
maxMomentum = 6; 
drillY = 67;
drillCnt = 0;
drillStallCnt = 0;
endDrill = 5;
endStall = 5;
returnY = room_height / 64;
rockCash = 50;

//
// values for creating/changing worm meter
// Special thanks to Shaun Spalding for explaining how to
// draw bars in "GameMaker Studio 2: Health Bar Tutorial" 
// https://www.youtube.com/watch?v=2iRKTFxT75Y
//
wormMeterVal = 100;
wormMeterMax = wormMeterVal;
wormDepletion = 1;
wormBarX = 88;
wormBarY = 26;
wormBarHeight = 20;
wormBarWidth = 308;
wormDecreaseCnt = 1;
wormDecreaseTime = 15;  // Determines the amount of frames until worm meter is updated
originalWormDecreaseTime = wormDecreaseTime;
wormEatenBoost = round(wormMeterMax / 2);

//
// Mole Boy states and speed values
//
// Thanks to Shaun Spalding for state machine explanation from
// "State Machines in GameMaker Studio 2" youtube video
// https://www.youtube.com/watch?v=yfFzz9mZkU4
//
canDrill = true;
drilling = false;
stalling = false;
returning = false;
inRock = false;
//currStep = beginStepVal;  // for checking the current step of Mole Boy
//state = func_neutral_state;

//
// Location values
//
y = startY;
x = room_width / 2;
depth = -5;

//
// Key values (save whether direction and other command keys have been pressed)
//
keyRight = false;
keyLeft = false;
keyUp = false;
keyDown = false;
keyAttack = false;
keyPower = false;
