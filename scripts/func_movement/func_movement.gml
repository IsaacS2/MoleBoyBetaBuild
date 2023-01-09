// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_movement(_obj, _direction, _maxDist){
	var i = _maxDist;
	while (i >= 1) {
		if (!place_meeting(_obj.x + (_direction * i) , _obj.y , obj_boundary)) {
			x += i * _direction;
			return i;
		}
		i--;
	}
	if (i <= 0 && place_meeting(_obj.x, _obj.y, obj_boundary)) {
		var j = i;
		if (place_meeting(_obj.x + (_direction * 0.01), _obj.y, obj_boundary)) {
			while (place_meeting(_obj.x, _obj.y, obj_boundary)) {
				x -= _direction;
				j += 1;
			}
		} else {
			while (place_meeting(_obj.x, _obj.y, obj_boundary)) {
				x += _direction;
				j += 1;
			}
		}
		return j;
	} else {
		return 0;
	}
}