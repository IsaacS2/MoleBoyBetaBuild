/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (irandom(2) > 0) {
	xFlip *= 1;
}

//
// add x-values to saw wall spawner
//
var _i = 15;

// adjust x-values of the left side of bent wall
repeat (4) {
	locationXArray[_i] = xFlip * (-256 + ((_i % 4) * 148));
	_i -= 1;
}

// adjust x-values of the left side of straight wall
repeat (4) {
	locationXArray[_i] = -256;
	_i -= 1;
}

// adjust x-values of the right side of bent wall
repeat (4) {
	locationXArray[_i] = xFlip * (256 + ((_i % 4) * 148));
	_i -= 1;
}

// adjust x-values of the right side of straight wall
repeat (4) {
	locationXArray[_i] = 256;
	_i -= 1;
}


//
// add y-values to saw wall spawner
//
_i = 15;

// repeated twice for left and right side of straight wall
repeat (2) {
	repeat (8) {
		locationYArray[_i] = ((_i % 8) * 128);
		_i -= 1;
	}
}

//
// spawn saw objects
//
_i = 15;
repeat (16) {
	instance_create_depth(locationXArray[_i], locationYArray[_i], 0, obj_saw_obstacle);
}

instance_destroy();
