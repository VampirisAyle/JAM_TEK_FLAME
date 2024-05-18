player_speed = 1;
sprint_speed = 2;
sprint_sprite_speed = 7;
sprite_speed = 5;
endurance_regeneration = false;
total_endurance = 100;
current_endurance = 100;
has_parchment = false;
parchment_nearby = false;

audio_playing = 0;
current_sound_played = audio_play_sound(snd_heart_beat, 2, true, 0);

dead = false;
draw_takup = false;
demon_spawn = false;

image_index = 1;
sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
