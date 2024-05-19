if (instance_exists(obj_joueur)) {
	var _movex = 0;
	var _movey = 0;
	var _speed = player_speed;
	var _sprite_speed = sprite_speed;
	var _player_distance_x = x - obj_joueur.x;
	var _player_distance_y = y - obj_joueur.y;

	if (_player_distance_y > 0) {
		_movey -= _speed;
		image_xscale = 0.2;
		sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
	} else {
		_movey += _speed;
		image_xscale = -0.2;
		sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
	}
 
	if (_player_distance_x < 0) {
		_movex += _speed;
		image_xscale = -0.2;
		sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
	} else {
		_movex -= _speed;
		image_xscale = 0.2;
		sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
	} 

	if (_movex == 0 && _movey == 0) {
		sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
		image_index = 1;
	}
	var _direction = point_direction(x, y, obj_joueur.x, obj_joueur.y);
	var _newx = x + lengthdir_x(_speed, _direction);
	var _newy = y + lengthdir_y(_speed, _direction);
	if (!place_meeting(_newx, y, obj_map_collision)) {
		x = _newx;
	}
	if (!place_meeting(x, _newy, obj_map_collision)) {
		y = _newy;
	}
	//move_and_collide(_movex, _movey, [obj_map_collision]);
}