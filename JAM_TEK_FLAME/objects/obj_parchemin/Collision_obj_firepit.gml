/// @description Insert description here
// You can write your code in this editor

{
	if (object_exists(obj_joueur)) {
		obj_joueur.nb_parchemin_burn += 1;
	}
	
	audio_play_sound(snd_burn, 1, false);

    instance_destroy();
}