textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 220;

txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);
txtb_XFull = textbox_width/txtb_spr_w + 0.15;


draw_set_font(global.font_main);
	

var _finalVol = global.TEXT_VOL * global.MASTER_VOL;

scr_Defaults_for_Text();

//Setup
if !setup && !setupComplete {
	
	setup = true;
	
	//Loop through pages
	for (var p = 0; p < page_number; p++) {
		
		//Find how many characters are on each page and store the number in text length array.
		text_length[p] = string_length(text[p]);
		
		//Get x position for textbox
		
		text_x_offset[p] = 17;
			
		//Setting individual characters and finding where lines should break
		for(var c = 0; c < text_length[p]; c++) {
			
			var _char_pos = c + 1;
			
			//Store individual character in "char" array
			char[c, p] = string_char_at(text[p], _char_pos);
			
			//Get current width of the line
			var _text_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_text_up_to_char) - string_width(char[c, p]);
			
			//Get the last free space
			if char[c, p] == " " {last_free_space = _char_pos + 1};
			
			//Get the line breaks
			if _current_txt_w - line_break_offset[p] > line_width {
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				
				var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			}
			
		}
		
		//Getting each characters' coords
		for(var c = 0; c < text_length[p]; c++) {
			
			var _char_pos = c + 1;
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			
			var _text_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_text_up_to_char) - string_width(char[c, p]);
			var _txt_line = 0;
			
			//Compensate for string breaks
			for(var lb = 0; lb < line_break_num[p]; lb++){
				
				if _char_pos >= line_break_pos[lb, p] {
					
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
					_current_txt_w = string_width(_str_copy);
					
					//Record the "line" this character should be on
					_txt_line = lb + 1; //+1 since "lb" starts at 0
				}
			}
			
			//Add into the x & y coords based on new info
			char_x[c, p] = textX + _current_txt_w;
			char_y[c, p] = textY + _txt_line * line_sep;
		}
			
	}
}


//Finish Setup
if setupComplete {
	setup = false;
}

//Type Writer Effect
if text_pause_timer <= 0 {
	
	if draw_char < text_length[page] {
		
		draw_char += text_spd;
		draw_char = clamp(draw_char, 0, text_length[page]);
		
		var _check_char = string_char_at(text[page], draw_char);
		
		
		if _check_char == " " {
			text_pause_timer = text_pause_time;
			
			if !audio_is_playing(snd_GeneralText) {
				audio_play_sound(snd_GeneralText, 8, false, _finalVol);
			}
		} else {
			if snd_count < snd_delay && _check_char != " " {
				snd_count++;
			} else {
				snd_count = 0;
				audio_play_sound(snd_GeneralText, 8, false, _finalVol);
			}
		}
	}
} else {
	text_pause_timer--;
}


//Flip Through Pages
/*if setup && !setupComplete {
	
		//If typing is done
		if draw_char == text_length[page] {
		
			//Next Page
			if page < page_number - 1 {
				page++;
				draw_char = 0;
			
			} else {
			
			
				//Link text for option
				if option_number > 0 {
					create_textbox(option_link_id[option_pos]);
				
					if global.PlayerChar == 0 {
						draw_sprite_ext(spr_CursorHead, image_index / 6, x, y, 1, 1, 0, c_white, 1);
					}
				}
			
				setupComplete = true;
			}
		}
	
}*/


//Drawing the actual textbox
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;

txtb_img += txtb_img_spd;

//Draw speaker
if speaker_sprite[page] != noone {
	if draw_char == text_length[page] {image_index = 0};
	sprite_index = speaker_sprite[page];
	
	var _speaker_x = textbox_x + xChange;
	
	//Draw actual speaker
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y - 215, 0.4, 0.4, 0, c_white, 0);
}

//Solid White Outline
draw_sprite_ext(spr_TextboxTrans, 0, _txtb_x, _txtb_y, starterText_Width/txtb_spr_w + 0.15, textbox_height/txtb_spr_h, 0, c_white, 0);

//Back of textbox
if speaker_sprite[page] = noone {
	draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, starterText_Width/txtb_spr_w + 0.15, textbox_height/txtb_spr_h, 0, c_white, 0);
} else {
	draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, starterText_Width/txtb_spr_w + 0.15, textbox_height/txtb_spr_h, 0, c_white, 0);
}


//Drawing the actual text
for(var c = 0; c < draw_char; c++) {
	
	///-----Special Stuffs-----///
	
	//Wavy text
	var _float_y = 0
	
	if float_text[c, page] == true {
		
		float_dir[c, page] += -8;
		_float_y = dsin(float_dir[c, page]) * 2;
		
	}
	
	//Shake text
	var _shake_x = 0;
	var _shake_y = 0;
	
	if shake_text[c, page] == true {
		shake_timer[c, page]--;
		
		if shake_timer[c, page] <= 0 {
			shake_timer[c, page] = irandom_range(4, 8);
			shake_dir[c, page] = irandom(360);
		}
		
		if shake_timer[c, page] <= 2 {
			_shake_x = lengthdir_x(1, shake_dir[c, page]);
			_shake_y = lengthdir_y(1, shake_dir[c, page]);
		}
	}
	
	
	//Change Text Alpha
	if setup && !setupComplete {
		if text_Alpha[c, page] < 1 {
			text_Alpha[c, page] += text_AlphaAdd[c, page];
		}
	} else if !setup && setupComplete {
		text_Alpha[c, page] = 0;
	}
	
	
	//Change Text Size
	if text_Size[c, page] > 1 {
		text_Size[c, page] -= text_SizeRemove[c, page];
	}
	
	draw_set_halign(fa_center);
	
		//The text
		draw_text_transformed_color(char_x[c, page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], text_Size[c, page], text_Size[c, page], 0, col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], otherTextAlpha * text_Alpha[c, page]);
	
	draw_set_halign(fa_left);
}


if draw_char == text_length[page] {
	if textAlphaTimer > 0 {
		textAlphaTimer -= 1;
	}
	
	if textAlphaTimer <= 0 {
		if otherTextAlpha > 0 {
			otherTextAlpha -= 0.01;
		}
	}
	
	if otherTextAlpha <= 0 {
		instance_destroy();
	}
} else {
	otherTextAlpha = 1;
}