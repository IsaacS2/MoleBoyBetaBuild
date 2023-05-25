/// @description Mole Boy's stats and values!

//
// Game By Isaac Sanchez
// Started Summer 2022
//

slip = 1;  // for diiferent environment changes
movement = 2;// * obj_control.moleBoySpeed;
currMovement = movement;  // unchanged variabled that is used to return movement to original value
right = 0;
startY = 96;
powerUp1 = 0;
powerUp2 = 0;
momentum = 0;
directionInc = 2;// * obj_control.moleBoySpeed;  // value used to increase/decrease Mole Boy's directional movement with input
noInputInc = 1;// * obj_control.moleBoySpeed;  // value used to stop Mole Boy's directional movement without input
maxMomentum = 6;// * obj_control.moleBoySpeed;  
drillY = 67; // room_height / 15;
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
canDrill = true;
drilling = false;
stalling = false;
returning = false;
inRock = false;

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
