/// @description Pause Screen!

gpu_set_blendenable(false);

if (pause) {
	surface_set_target(application_surface);
	
	if (surface_exists(pauseSurf)) {
		draw_surface(pauseSurf, 0, 0);
		
		gpu_set_blendenable(true);
		draw_set_alpha(0.5);
	    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	    draw_set_alpha(1);
	    draw_set_halign(fa_center);
	    draw_text(room_width / 2, room_height / 2, "PAUSED");
	    draw_set_halign(fa_left);
		gpu_set_blendenable(false);
		
	}
	else {  // restore surface from buffer if lost
		pauseSurf = surface_create(resW, resH);
		buffer_set_surface(pauseSurfBuffer, pauseSurf, 0)
	}
	
	surface_reset_target()
}

if (keyboard_check_pressed(ord("P"))) {
	if (!pause) {  // time to pause
		layerID = obj_control.lay_id;
		
		// deactivate everything except this object
		instance_deactivate_all(true);
		
		// need to pause background animation
		layer_vspeed(layerID, 0);
		
		// save current game state (except gui contents)
		pauseSurf = surface_create(resW, resH);
		surface_set_target(pauseSurf);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		// back up this surface to a buffer in case it's lost
		if (buffer_exists(pauseSurfBuffer)) {
			buffer_delete(pauseSurfBuffer);
		}
		// multiplied by 4 for bits
		pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
	} else {  // time to unpause
		instance_activate_all();
		if (surface_exists(pauseSurf)) {  // free surface
			surface_free(pauseSurf);
		}
		if (buffer_exists(pauseSurfBuffer)) {  // free surface in buffer
			buffer_delete(pauseSurfBuffer);
		}
		layer_vspeed(obj_control.lay_id, -floor(obj_control.obstacleSpeed / global.rockSlowDown));
	}
	pause = !pause
}

gpu_set_blendenable(true);
