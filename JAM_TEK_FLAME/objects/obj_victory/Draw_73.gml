var _camera = view_get_camera(0);
var _view_x = camera_get_view_x(_camera);
var _view_y = camera_get_view_y(_camera);
var _view_h = camera_get_view_height(_camera);
var _view_w = camera_get_view_width(_camera);
var _center_x = _view_x + (_view_w / 2);
var _center_y = _view_y + (_view_h / 2);

var _victory_txt = "Demon banni !"

draw_set_font(fnt_menu);

if ((delay == false && (current_time - time) >= delay_time) || (print == true && (current_time - time) >= print_time)) {
	if (print == true) {
		draw_text_transformed(_center_x - string_width(_victory_txt) / 2 + 20, _center_y - string_height(_victory_txt) / 2 - room_height / 2.7, _victory_txt, 1, 1, 0);
	}
	if ((print == true && (current_time - time) >= print_time * 2)) {
		print = false;
		time = current_time;
	}
	if (delay == false) {
		delay = true;
		print = true;
		time = current_time;
	}
}

if (delay == true && print == false && (current_time - time) >= print_time / 2) {
	print = true;
}

draw_set_font(-1);

draw_text(0, 0, "[X] - retourner au menu");