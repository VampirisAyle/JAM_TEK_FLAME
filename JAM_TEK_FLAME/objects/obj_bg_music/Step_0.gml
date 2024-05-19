if (currentplayed != PLAYEDSOUND.GAMESOUND && (room == rm_forest1 || room == rm_cemetery1 || room == rm_church1 || room == rm_crypt1)) {
	audio_sound_gain(bg_music_game, 1, 2000);
	audio_sound_gain(bg_music_menu, 0, 2000);
	audio_sound_gain(bg_music_victory, 0, 2000);
	audio_sound_set_track_position(bg_music_game, 0);
	currentplayed = PLAYEDSOUND.GAMESOUND;
} else if (currentplayed != PLAYEDSOUND.MENUSOUND && (room == rm_menu1 || room == rm_menu2 || room == rm_menu3)) {
	audio_sound_gain(bg_music_game, 0, 2000);
	audio_sound_gain(bg_music_menu, 1, 2000);
	audio_sound_gain(bg_music_victory, 0, 2000);
	audio_sound_set_track_position(bg_music_menu, 0);
	currentplayed = PLAYEDSOUND.MENUSOUND;
} else if (currentplayed != PLAYEDSOUND.VICTORYSOUND && (room == rm_victory)) {
	audio_sound_gain(bg_music_game, 0, 1000);
	audio_sound_gain(bg_music_menu, 0, 1000);
	audio_sound_gain(bg_music_victory, 1, 1000);
	audio_sound_set_track_position(bg_music_victory, 0);
	currentplayed = PLAYEDSOUND.VICTORYSOUND;
}
