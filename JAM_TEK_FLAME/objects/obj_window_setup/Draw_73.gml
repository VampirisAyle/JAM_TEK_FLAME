surface_set_target(light_surface);

var _camera = view_get_camera(0);

if(!surface_exists(light_surface)) {
	var _cam_width = camera_get_view_width(_camera);
	var _cam_height = camera_get_view_height(_camera);

	light_surface = surface_create(_cam_width, _cam_height);
}

draw_clear(c_black);
camera_apply(_camera);
var _scale = 3 + 0.25 * sin(current_time / 1000);

gpu_set_blendmode(bm_subtract);

with (obj_joueur) {
	draw_sprite_ext(spr_light, 0, self.x, self.y, _scale, _scale, 0, c_white, 255);
}

gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_surface_stretched(light_surface, camera_get_view_x(_camera), camera_get_view_y(_camera), window_get_width(), window_get_height());