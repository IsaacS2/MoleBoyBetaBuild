/// @description Question Rock Enemy stats!
yDelete = -128;
xDelete = 200;
right = true;
currRight = 1;

baseMinYSpeed = 3;
baseMaxYSpeed = 5;
minYSpeed = baseMinYSpeed * global.currentExcavationSpeed;
maxYSpeed = baseMaxYSpeed * global.currentExcavationSpeed;
xSpeed = 1;
escapeDistance = 180;

instance_create_layer(x, y, "Instances", obj_rock_question);