if(object_exists(obj_joueur)){
	draw_sprite(spr_endurance_arriere,1,8,8)
	draw_sprite_ext(spr_endurance_face,1,8,8,
	max(0,obj_joueur.current_endurance/obj_joueur.total_endurance),1,0,c_white,1)
}