/// @description Question Rock Enemy stats!
func_reset_spin = function() {
	spinning = false;
	spinAngle = spinStartAngle;
	spinTimeCnt = 0;
	currentSprite = rightSprite;
}

yDelete = -200;
xDelete = 300;
right = true;
currRight = 1;
imageAngle = 0;
xSpeed = 1;
ySpeed = 2;
escapeDistance = 180;

spinTimeCnt = 0;
spinTimeIncVal = 1;
spinTimeLimit = 180;
spinDistance = 90;
spinStartAngle = 90;
spinAngle = spinStartAngle;
spinAngleIncVal = 4;
spinEndAngleDiff = 360;
spinEndAngle = 0;
spinXPoint = 0;
spinYPoint = 0;
spinning = false;

escapeWarpTimeLimit = 60;
escapeEndTimeLimit = 105;
escapeWarpTimeCnt = 0;
escapeEndTimeCnt = 0;
escapeIncVal = 1;
escapeDistance = 160;
escapeDigImageIndex = 16;  // sprite image index where enemy digs towards background
escaping = false;
escapeAlpha = 1;
escapeAlphaDecrementor = 0.04;
escapeAlphaIncrementor = 0.04;
escapeSpriteStage = 0;

rightSprite = spr_question_enemy_right;
leftSprite = spr_question_enemy_left;
escapingSprite = spr_question_enemy_escaping;
armEscapingSprite = spr_question_enemy_escaping_arms;
earEscapingSprite = spr_question_enemy_escaping_ears;
legEscapingSprite = spr_question_enemy_escaping_legs;
deathSprite = spr_question_enemy_left_dead;
deathSpinningSprite = spr_question_enemy_left_dead_spinning;
currentSprite = rightSprite;


armXDiff = 10;
armYDiff = 40;
earXDiff = -51;
earYDiff = -35;
footXDiff = -10;
footYDiff = 45;
rotateIncVal = 1;

depth = -3;