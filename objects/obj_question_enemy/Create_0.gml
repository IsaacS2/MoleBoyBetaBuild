/// @description Question Rock Enemy stats!
yDelete = -128;
xDelete = 200;
right = true;
currRight = 1;
imageAngle = 0;

baseMinYSpeed = 0;
baseMaxYSpeed = 4;
minYSpeed = baseMinYSpeed * global.currentExcavationSpeed;
maxYSpeed = baseMaxYSpeed * global.currentExcavationSpeed;
xSpeed = 1;
escapeDistance = 180;

rightSprite = spr_question_enemy_right;
leftSprite = spr_question_enemy_left;
armSprite = spr_question_enemy_right_arm;
earSprite = spr_question_enemy_right_ear;
footSprite = spr_question_enemy_right_foot;
currentSprite = rightSprite;

instance_create_layer(x, y, "Instances", obj_rock_question);
obj_rock_question.image_xscale = currRight;