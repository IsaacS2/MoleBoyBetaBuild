/// @description Draw score and other GUI elements!
draw_set_halign(fa_right);
draw_text(display_get_gui_width() - 24, 12, string( ceil( -global.currentDepth ) ) + " ft");
draw_sprite(spr_money_count, 0, display_get_gui_width() - 88, 60);
draw_sprite(spr_item_holder_left, 0, leftRingX, ringY);
draw_sprite(spr_item_holder_right, 0, rightRingX, ringY);
draw_text(display_get_gui_width() - 32, 48, ( "$ " + string( ceil( global.currentExcavationWinnings ) ) ) );
draw_text(48, display_get_gui_height() - 24, string( ceil(global.bestDepth)));
draw_text(display_get_gui_width() - 32, display_get_gui_height() - 24, ( "$ " + string( global.totalWinnings ) ) );
draw_text(display_get_gui_width() - 32, 96, ( "power slot 1: " + string(obj_mole_boy.powerUp1) ) );