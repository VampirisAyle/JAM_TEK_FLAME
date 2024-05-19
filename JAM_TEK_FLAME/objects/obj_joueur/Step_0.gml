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

if (nb_parchemin_burn == nb_parchemin_burn_needed) {
	room_restart();
	room_goto(rm_victory);
}

if (keyboard_check(ord("X"))) {
	room_restart();
	room_goto(rm_menu1);
}

if (keyboard_check(ord("R")) && dead == true) {
	room_restart();
}

if (keyboard_check(ord("Z")) && dead == false) {
	_movey -= _speed;
	sprite_index = spr_joueur_haut;
	sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
}

if (keyboard_check(ord("S")) && dead == false) {
	_movey += _speed;
	sprite_index = spr_joueur_bas;
	sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
}

if (keyboard_check(ord("D")) && dead == false) {
	_movex += _speed;
	sprite_index = spr_joueur_droite;
	sprite_set_speed(sprite_index, _sprite_speed, spritespeed_framespersecond);
}

if (keyboard_check(ord("Q")) && dead == false) {
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
	draw_takup = true;
} else {
	draw_takup = false;
}

if (parchment_nearby && keyboard_check_pressed(ord("E")) && !has_parchment) {
    instance_destroy(_parchment);
    has_parchment = true;
}

if (keyboard_check_pressed(ord("T")) && has_parchment) {
    var _new_parchment = instance_create_layer(x, y, "Instances_1", obj_parchemin);
    has_parchment = false;
}

move_and_collide(_movex, _movey, [obj_map_collision]);



//AUDIO
if (instance_exists(obj_demon)) {
	var _distance = point_distance(x, y, obj_demon.x, obj_demon.y);

	if (_distance > 350 && audio_playing != 0) {
		audio_sound_gain(current_sound_played, 0, 2000);
		audio_playing = 0;
	}
	if (_distance < 350 && _distance > 90 && audio_playing != 1) {
		audio_sound_gain(current_sound_played, 0.8, 1000);
		audio_sound_pitch(current_sound_played, 1);
		audio_playing = 1;
	}
	if (_distance < 90 && audio_playing != 2) {
		audio_sound_gain(current_sound_played, 1, 500);
		audio_sound_pitch(current_sound_played, 1.5);
		audio_playing = 2;
	}
}

if (dead == true) {
	audio_stop_sound(current_sound_played);
}



//SPAWN
if (obj_hud.time_to_spawn >= obj_hud.time_for_spawn && demon_spawn == false) {
	if (instance_exists(obj_firelight)) {
		var _demon = instance_create_layer(obj_firelight.x, obj_firelight.y - 80, "Instances", obj_demon);
	}
	demon_spawn = true;
}