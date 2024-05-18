if (dead == true) {
	var _camera = view_get_camera(0);
	var _view_x = camera_get_view_x(_camera);
	var _view_y = camera_get_view_y(_camera);
	var _view_h = camera_get_view_height(_camera);
	var _view_w = camera_get_view_width(_camera);
	var _center_x = _view_x + (_view_w / 2);
	var _center_y = _view_y + (_view_h / 2);
	draw_sprite(spr_jumpscare, 0, _center_x, _center_y);

	var _restart_txt = "[R] - Redemarrer"
	draw_text(_center_x - string_width(_restart_txt) / 2, _view_y + string_height(_restart_txt), _restart_txt);
}

if (draw_takup == true) {
	var _takeup_txt = "[E] - Ramasser"
	draw_text(x - (string_width(_takeup_txt) / 2), y - sprite_height, _takeup_txt);
}
