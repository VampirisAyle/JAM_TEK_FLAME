/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
window_set_size(1366, 768);

var _camera = view_get_camera(1);
var _cam_width = camera_get_view_width(_camera);
var _cam_height = camera_get_view_height(_camera);

light_surface = surface_create(_cam_width, _cam_height);
