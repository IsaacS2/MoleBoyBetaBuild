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
spinCnt = 0;
spinIncVal = 1;
spinTimeLimit = 90;
spinDistance = 100;
spinStartAngle = 90;
spinEndAngle = 90;



rightSprite = spr_question_enemy_right;
rightArmSprite = spr_question_enemy_right_arm;
rightEarSprite = spr_question_enemy_right_ear;
rightFootSprite = spr_question_enemy_right_foot;
leftSprite = spr_question_enemy_left;
leftArmSprite = spr_question_enemy_left_arm;
leftEarSprite = spr_question_enemy_left_ear;
leftFootSprite = spr_question_enemy_left_foot;

currentArmSprite = rightArmSprite;
currentEarSprite = rightEarSprite;
currentFootSprite = rightFootSprite;
currentSprite = rightSprite;

armXDiff = 10;
armYDiff = 40;
earXDiff = -51;
earYDiff = -35;
footXDiff = -10;
footYDiff = 45;
rotateIncVal = 1;


depth = -3;