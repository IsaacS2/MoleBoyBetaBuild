/// @description Obstacle stats!

//
// Game By Isaac Sanchez
// Started Summer 2022
//

//
// values for calculating speed
//
divider = 96;
multiplier = 9;

yMovement = multiplier; //floor ((room_height / divider));
yStart = room_height + 64;
yDelete = -64;  // -160 for big rock use
image_speed = 0;
newGameSpeed = 1;


y = yStart;