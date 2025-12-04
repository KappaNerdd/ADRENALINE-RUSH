if !instance_exists(obj_Textbox) {
	instance_destroy();
}



if instance_exists(obj_Textbox) {
	with (obj_Textbox) {
		if !setupComplete {
			other.fastForwardAlpha = 1;
			
			if draw_char < text_length[page] {
				other.playAlpha = 0.5;
				other.forwardAlpha = 1;
			} else {
				other.playAlpha = 1;
				other.forwardAlpha = 0.5;
			}
		} else {
			other.playAlpha = 0.5;
			other.forwardAlpha = 0.5;
			other.fastForwardAlpha = 0.5;
		}
	}
}