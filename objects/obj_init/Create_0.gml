/// @description Resolution/aspect ratio calculations
// Special thanks to PixelatedPope for Gamemaker-related
// screen-resizing explanations and code found in both 
// "Resolution and Aspect Ratio Management for Game Maker - Part 3" 
// and "GMS2 Cameras: As Simple as Possible"
// https://www.youtube.com/watch?v=wv3R2Q536ZU
// https://www.youtube.com/watch?v=_g1LQ6aIJFk
//
/*
display_width = display_get_width();
display_height = display_get_height();
ideal_height = 0;
ideal_width = 960;
zoom = 1;
max_zoom = 1;

aspect_ratio = display_width / display_height;

ideal_height = round(ideal_width * aspect_ratio);

if (display_width mod ideal_width != 0) {
	var d = round(display_width / ideal_width);
	ideal_width = display_width / d;
}

if (display_height mod ideal_height != 0) {
	var d = round(display_height / ideal_height);
	ideal_height = display_height / d;
}

if (ideal_width & 1) {
	ideal_width++;
}
if (ideal_height & 1) {
	ideal_height++;
}

max_zoom = floor (display_height / ideal_height);

surface_resize(application_surface, ideal_width, ideal_height);
window_set_size(ideal_width, ideal_height);
*/