var _movex = 0;
var _movey = 0;
var _speed = player_speed;
var _sprite_speed = sprite_speed;

if (current_endurance == 0) {
	endurance_regeneration = true;
} else if (current_endurance == 100) {
	endurance_regeneration = false;
}

if ((endurance_regeneration || !keyboard_check(vk_shift)) && current_endurance != total_endurance) {
	current_endurance += 1;
}

if (keyboard_check(vk_shift) && endurance_regeneration == false) {
	_speed += sprint_speed;
	_sprite_speed = sprint_sprite_speed;
	current_endurance -= 1;
}

if (keyboard_check(ord("Z"))) {
	_movey -= _speed;
	sprite_index = spr_joueur_haut;
	sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
}

if (keyboard_check(ord("S"))) {
	_movey += _speed;
	sprite_index = spr_joueur_bas;
	sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
}

if (keyboard_check(ord("D"))) {
	_movex += _speed;
	sprite_index = spr_joueur_droite;
	sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
}

if (keyboard_check(ord("Q"))) {
	_movex -= _speed;
	sprite_index = spr_joueur_gauche;
	sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
}

if (!keyboard_check(ord("Q")) && !keyboard_check(ord("D")) && !keyboard_check(ord("Z")) && !keyboard_check(ord("S"))) {
	sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
	image_index = 1;
}

parchment_nearby = false;
var _parchment = instance_nearest(x, y, obj_parchemin);
if (_parchment != noone && distance_to_object(_parchment) < 16) {
    parchment_nearby = true;
}

if (parchment_nearby && keyboard_check_pressed(ord("E")) && !has_parchment) {
    instance_destroy(_parchment);
    has_parchment = true;
}

if (keyboard_check_pressed(ord("T")) && has_parchment) {
    var _new_parchment = instance_create_layer(x, y, "Instances", obj_parchemin);
    has_parchment = false;
}

move_and_collide(_movex, _movey, [obj_map_collision]);