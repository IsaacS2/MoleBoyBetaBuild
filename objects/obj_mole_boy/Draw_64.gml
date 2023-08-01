/// @description Draw worm meter!

//
// Thank you to Shaun Spalding for explaining how to
// draw bars in "GameMaker Studio 2: Health Bar Tutorial" 
// https://www.youtube.com/watch?v=2iRKTFxT75Y
//

draw_sprite(spr_worm_meter_bg, 0, wormBarX, wormBarY);
draw_sprite_stretched(spr_worm_bar, 0, wormBarX, wormBarY, floor((wormMeterVal / wormMeterMax) * wormBarWidth), wormBarHeight);
draw_sprite(spr_worm_meter, 0, wormBarX, wormBarY);
draw_sprite(spr_worm_icon, 0, wormBarX - 68, wormBarY - 16);


if (addRightPowerupSprite) {
	draw_sprite(spr_icon_powerup_saw, currSawIconIndex, rightPowerupIconX, powerupIconY);
	if (currSawIconIndex < powerupSawIconAnimationLength - 1) {
		currSawIconIndex++;
	}
}
