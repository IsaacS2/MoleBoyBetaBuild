/// @description SpeedUp values

//
// Time to speed up obstacles!
//
if (newGameSpeed < obj_control.speedUp) {
	yMovement = floor(multiplier * obj_control.speedUp); //floor ((room_height / divider) * obj_control.speedUp);
	newGameSpeed = obj_control.speedUp;
}