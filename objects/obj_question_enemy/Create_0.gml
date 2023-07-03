/// @description Question Rock Enemy stats!
yDelete = -128;
xDelete = 200;
right = true;
currRight = 1;

baseMinYSpeed = 0;
baseMaxYSpeed = 4;
minYSpeed = baseMinYSpeed * global.currentExcavationSpeed;
maxYSpeed = baseMaxYSpeed * global.currentExcavationSpeed;
xSpeed = 1;
escapeDistance = 180;

rightSprite = spr_question_enemy_right;
leftSprite = spr_question_enemy_left;
currentSprite = rightSprite;

instance_create_layer(x, y, "Instances", obj_rock_question);