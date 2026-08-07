getCharacterControls();

if instance_exists(obj_Player) && place_meeting(x, y, obj_Player) 
&& obj_Player.can_MoveFULL && !instance_exists(obj_Textbox) && action2_Key 
&& obj_Player.ground && obj_Player.vel == 0 && !obj_Player.stomped && !obj_Player.specialIdle {
	create_textbox(text_id);
}

visible = global.DEBUG;