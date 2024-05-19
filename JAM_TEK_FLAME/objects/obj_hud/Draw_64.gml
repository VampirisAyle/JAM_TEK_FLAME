if(object_exists(obj_joueur) && obj_joueur.dead == false){
	draw_sprite(spr_endurance_arriere,1,8,8)
	draw_sprite_ext(spr_endurance_face,1,8,8,
	max(0,obj_joueur.current_endurance/obj_joueur.total_endurance),1,0,c_white,1)


	if (time_to_spawn < time_for_spawn) {
		time_to_spawn = current_time - start_time;
	}

	var _delay = int64((time_for_spawn - time_to_spawn) / 1000);
	var _summon_txt = "Temps avant l'invocation : ";
	var _menu_txt = "[X] - Retourner au menu";
	draw_text(8, 8 + string_height(_summon_txt), _summon_txt + string(_delay) + "\n" + _menu_txt);
}