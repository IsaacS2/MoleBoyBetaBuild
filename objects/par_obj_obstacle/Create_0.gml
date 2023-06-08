/// @description Obstacle stats!
//
// Game By Isaac Sanchez
// Started Summer 2022
//

//
// values for calculating speed
//

yMovement = floor(startingLayerSpeed * global.currentExcavationSpeed);
yStart = room_height + 64;
yDelete = -64;  // -160 for big rock use
image_speed = 0;

y = yStart;