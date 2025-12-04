getCharacterControls();

if instance_exists(obj_Player) {
	if place_meeting(x, y, obj_Player) && ((action2_Key)) && !instance_exists(obj_Textbox) && obj_Player.vel == 0 && obj_Player.ground == true && obj_Player.stomped == false && obj_Player.ducking == false && obj_Player.look_up == false && obj_Player.specialIdle == false {
		create_textbox(text_id);
	}
}