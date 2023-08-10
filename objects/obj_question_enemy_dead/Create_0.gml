// dead enemy stats!
falling = false;
vspd = 0;
normalGravityAcceleration = .6;
maxGravityPull = 14;
deathSprite = spr_question_enemy_left_dead;
deathSpinningSprite = spr_question_enemy_left_dead_spinning;
currentSprite = deathSprite;

if (!place_meeting(x, y, obj_mole_boy)) {
	falling = true;
	currentSprite = deathSpinningSprite;
	sprite_index = deathSpinningSprite;
}

depth = -6;
xMovement = 6;
yMovement = 6;
turnSpeed = -19;
ySpinningStartDiff = -24;
yDelete = -200;
xDelete = 300;