getCharacterControls();

if instance_exists(obj_Player) && place_meeting(x, y, obj_Player) 
&& obj_Player.can_MoveFULL && !instance_exists(obj_Textbox) && !instance_exists(obj_RoomTransParent) && action2_Key 
&& obj_Player.ground && obj_Player.vel == 0 && !obj_Player.stomped && !obj_Player.specialIdle
&& !obj_Player.ducking && !obj_Player.look_up && obj_Player.canTalk {
	create_textbox(text_id);
}

visible = global.DEBUG;