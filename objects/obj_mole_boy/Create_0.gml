/// @description Mole Boy's stats and values!
#macro baseMovement 2
#macro baseDirectionIncVal 2
#macro baseNoInputIncVal 1
#macro baseMaxMomentum 6
#macro baseEndStall 5

//
// Game By Isaac Sanchez
// Started Summer 2022
//

//
// method variables for state machine
//
// func_neutral_state
//
// This method performs movement actions and variable changes when Mole Boy
// is in the neutral state (not in the process of attacking,
// can move freely).
//
func_neutral_state = function(_step) {
	if (_step == beginStepVal) {
		if (keyPower && (powerUp1 != 0 || powerUp2 != 0) && 
		(global.rockSlowDown & outsideRockSpeed) && !global.powerActive) {
			// if powerUp1 == powerUp2, super power!
			if (powerUp1 != 0) {
				powerUp1 = 0;
			}
			else {
				currSawIconIndex = 0;
				addRightPowerupSprite = false;
				powerUp2 = 0;
			}
			func_switchTo_powerup_activate();
			exit;
		}
		if (keyAttack) { // Drilling time!
			func_switchTo_drilling();
			state = func_drilling_state;
			state(_step);
			exit;
		}
		func_left_and_right_movement();
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
	func_destroy_rocks();
	if (place_meeting(x, y, obj_big_rock_obstacle)) {
		instance_destroy(instance_nearest(x, y, obj_big_rock_obstacle));
	}
	if (_step == beginStepVal) {
		if (drillCnt < endDrill) {
			y += drillY; // Mole Boy's drilling downwards
			drillCnt++;
			func_left_and_right_movement();
		} else {
			state = func_stalling_state;
			state(_step);
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
	func_destroy_rocks();
	if (_step == beginStepVal) {
		if (drillStallCnt >= endStall) {
			func_switchTo_returning();
			state = func_returning_state;
			state(_step);
			exit;
		} else {
			func_left_and_right_movement();
		}
		drillStallCnt++;
	}
}


//
// func_returning_state
//
// This method performs movement actions and variable changes when Mole Boy
// is returning to the top of the screen after a drilling attack.
//
func_returning_state = function(_step) {
	if (_step == beginStepVal) {
		func_switchFrom_returning_and_yMovement();
		if (y == startY) {
			func_mole_restart_normal_drilling_sound();
			state = func_neutral_state;
		}
		func_left_and_right_movement();
	}
}


//
// func_death_state
//
// This method plays animation for when Mole Boy dies.
//
func_death_state = function(_step) {
	if (deathCnt < 1) {
		stunCnt++;
		if (stunCnt > endStun) {
			func_sprite_switch(deadSprite);
			deathCnt++;
		}
	} else {
		deathCnt++
		if (deathCnt > endDeath) {
			func_save_game();
			func_reset_excavation();
			exit;
		}
	}
}

func_powerup_state = function(_step) {
	if (powerActCnt >= endSawPowerupAct) {
		powerActCnt = 0;
		func_switchFrom_powerup_activate();
		exit;
	}
	else {
		powerActCnt++;
	}
	if (image_index >= image_number - 1) {
		image_angle += 18;
	}
}


slip = 1;  // for diiferent environment changes
movement = baseMovement;
normalMovement = movement;  // unchanged variable that is used to return movement to original value
right = 0;
startY = round(room_height / 10);
powerUp1 = 0;
powerUp2 = 0;
momentum = 0;
angleMultiplier = 2;
directionIncVal = baseDirectionIncVal;  // value used to increase/decrease Mole Boy's directional movement with input
noInputIncVal = baseNoInputIncVal;  // value used to stop Mole Boy's directional movement without input
maxMomentum = baseMaxMomentum; 
drillY = 67;
drillCnt = 0;
drillStallCnt = 0;
stunCnt = 0;
powerActCnt = 0;
deathCnt = 0;
endDrill = 5;
endStall = baseEndStall;
endStun = 45;
endSawPowerupAct = 35;
endDeath = 120;
returnY = room_height / 64;
rockCash = 50;
sturdyRockCash = 100;
questionRockCash = 500;
deathSpriteSpeed = 12;
centerYDiff = 32;  // to add to y values of sprites/objects that aim to be in the center of MB

//
// values for creating/changing worm meter
// Special thanks to Shaun Spalding for explaining how to
// draw bars in "GameMaker Studio 2: Health Bar Tutorial" 
// https://www.youtube.com/watch?v=2iRKTFxT75Y
//
wormMeterVal = 100;
wormMeterMax = wormMeterVal;
wormDecrementVal = 1;
wormBarX = 88;
wormBarY = 26;
wormBarHeight = 20;
wormBarWidth = 308;
wormDecreaseCnt = 0;
wormDecrementTime = 15;  // Determines the amount of frames until worm meter is updated
originalWormDecrementTime = wormDecrementTime;
wormBoost = round(wormMeterMax / 2);
wormMeterQuarterVal = round(wormMeterVal / 4);

powerupIconY = 92;
leftPowerupIconX = 26;
rightPowerupIconX = 105;
addRightPowerupSprite = false;
addLeftPowerupSprite = false;
powerupSawIconAnimationLength = sprite_get_number(spr_icon_powerup_saw);
currSawIconIndex = 0;
powerupActAnimationLength = sprite_get_number(spr_powerup_activated);
currPowerupIndex = 0;

//
// Thanks to Shaun Spalding for state machine explanation from
// "State Machines in GameMaker Studio 2" youtube video
// https://www.youtube.com/watch?v=yfFzz9mZkU4
//
currStep = beginStepVal;  // for checking the current step of Mole Boy
state = func_neutral_state;
normalSprite = spr_mole_boy_no_effects;
stunnedSprite = spr_mole_boy_stun;
deadSprite = spr_mole_boy_death;
attackingSprite = spr_mole_boy_drilling_red;
topDrillSprite = spr_mole_boy_front_drill_residue;
bottomDrillSprite = spr_mole_boy_back_drill_residue;
powerupSawSprite = spr_mole_boy_powerup_saw;
currentSprite = normalSprite;

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


//
// Thanks to Shaun Spalding for sound effects explanation from
// "GameMaker Studio 2: Complete Platformer Tutorial (Part 13: Sound effects)" youtube video
// https://www.youtube.com/watch?v=AfQFZXdmAEs&t=24s
//
func_mole_restart_normal_drilling_sound();
restartInsideRockSound = false;