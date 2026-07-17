if global.PlayerID != noone {
	with(global.PlayerID) {
		if place_meeting(x, y, other) && can_MoveFULL && !instance_exists(obj_Textbox) && action2_Key && ground && vel == 0 && !stomped && !specialIdle {
			create_textbox(other.text_id);
		}
	}
}