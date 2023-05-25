/// @description Draw score and other GUI elements!
draw_set_halign(fa_right);
draw_text(room_width - 24, 12, string( ceil( -global.currentDepth ) ) + " ft");
draw_sprite(spr_money_count, 0, room_width - 88, 60);
draw_text(room_width - 32, 48, ( "$ " + string( ceil( global.currentExcavationWinnings ) ) ));