bg_music_game = audio_play_sound(snd_embient_music, 10, true, 0);
bg_music_menu = audio_play_sound(snd_main_menu, 10, true);
bg_music_victory = audio_play_sound(snd_victory_music, 10, true, 0);

enum PLAYEDSOUND {GAMESOUND, MENUSOUND, VICTORYSOUND};

currentplayed = PLAYEDSOUND.MENUSOUND;

persistent = true;