/// @description Obstacle stats!

//
// Game By Isaac Sanchez
// Started Summer 2022
//

//
// values for calculating speed
//
multiplier = 9;

yMovement = floor(multiplier * global.currentExcavationSpeed);
yStart = room_height + 64;
yDelete = -64;  // -160 for big rock use
image_speed = 0;

y = yStart;