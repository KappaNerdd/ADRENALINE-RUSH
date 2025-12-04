getCharacterControls();

confirm_key = jump_Key;
skip_key = action_Key;
wrist_key = action1_Key_Held;

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 300;

txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);
txtb_XFull = textbox_width/txtb_spr_w + 0.15;



var _finalVol = global.TEXT_VOL * global.MASTER_VOL;

scr_Defaults_for_Text();

//Setup
if !setup && !setupComplete {
	setup = true;
	
	if instance_exists(obj_Player) {
		obj_Player.can_MoveFULL = false;
	}
	
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
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
			char_x[c, p] = _current_txt_w;
			char_y[c, p] = _txt_line * line_sep;
		}
	}
}


//Finish Setup
if setupComplete {
	setup = false;
}

var _textboxWidth = 0;

//Expand Textbox
if setup {
	_textboxWidth = 728;
	
	if instance_exists(obj_Player) {
		obj_Player.can_MoveFULL = false;
	}
} else if !setup && setupComplete {
	_textboxWidth = 0;
	
	if starterText_Width <= 0.5 {
		instance_destroy();
		
		if instance_exists(obj_Player) {
			obj_Player.can_MoveFULL = true;
		}
	}
}

starterText_Width = lerp(starterText_Width, _textboxWidth, 0.25);

//Type Writer Effect
if text_pause_timer <= 0 {
	if draw_char < text_length[page] {
		if !speaker2Char[page] {
			if speakerChecker == speaker_Name[page] && xChange >= xChangeFinish {
				draw_char += text_spd;
			}
		} else {
			if speakerChecker2 == speaker_Name[page] && xChange2 <= -xChangeFinish {
				draw_char += text_spd;
			}
		}
		
		draw_char = clamp(draw_char, 0, text_length[page]);
		
		
		var _check_char = string_char_at(text[page], draw_char);
		
		if !speaker2Char[page] && speakerChecker == speaker_Name[page] && xChange >= xChangeFinish {
			if (_check_char == "." or _check_char == ",") {
				text_pause_timer = text_pause_time;
			
				if !audio_is_playing(snd[page]) {
					audio_play_sound(snd[page], 8, false, _finalVol);
				}
			} else {
				if snd_count < snd_delay && _check_char != " " {
					snd_count++;
				} else {
					snd_count = 0;
					audio_play_sound(snd[page], 8, false, _finalVol);
				}
			}
		} else if speaker2Char[page] && speakerChecker2 == speaker_Name[page] && xChange <= -xChangeFinish {
			if (_check_char == "." or _check_char == ",") {
				text_pause_timer = text_pause_time;
			
				if !audio_is_playing(snd[page]) {
					audio_play_sound(snd[page], 8, false, _finalVol);
				}
			} else {
				if snd_count < snd_delay && _check_char != " " {
					snd_count++;
				} else {
					snd_count = 0;
					audio_play_sound(snd[page], 8, false, _finalVol);
				}
			}
		}
	}
} else {
	text_pause_timer--;
}


//Force Page Flip without Input
if global.ForceLine == true && draw_char == text_length[page] && option_number == 0 {
	//Next Page
	if page < page_number - 1 {
		page++;
		draw_char = 0;
	} else {
		setupComplete = true;
	}
} else if global.ForceLine == true && draw_char == text_length[page] && option_number != 0 {
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



//Flip Through Pages
if setup && !setupComplete {
	if confirm_key && global.ForceLine == false {
		//If typing is done
		if draw_char == text_length[page] {
			obj_SFXManager.funkinFav = true;
			textboxYChange = 10;
		
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
	} else if skip_key && draw_char != text_length[page] && global.ForceLine == false {
		//Skip Text for Page
		draw_char = text_length[page];
		
		if !speaker2Char[page] {
			speakerChecker = speaker_Name[page];
			xChange = xChangeFinish;
		} else {
			speakerChecker2 = speaker_Name[page];
			xChange2 = -xChangeFinish;
		}
	}

	//Deltarune Wrist Protector Mechanic
	if wrist_key && draw_char != text_length[page] && global.ForceLine == false {
		//Skip Text for Page
		draw_char = text_length[page];
		
		if !speaker2Char[page] {
			speakerChecker = speaker_Name[page];
			xChange = xChangeFinish;
		} else {
			speakerChecker2 = speaker_Name[page];
			xChange2 = -xChangeFinish;
		}
		
		//If typing is done
		if draw_char == text_length[page] {
			//Next Page
			if page < page_number - 1 && option_number != 0 {
				page++;
				draw_char = 0;
			} 
		}
	} else if wrist_key && option_number == 0 && global.ForceLine == false {
		//Skip Text for Page
		draw_char = text_length[page];
		
		if !speaker2Char[page] {
			speakerChecker = speaker_Name[page];
			xChange = xChangeFinish;
		} else {
			speakerChecker2 = speaker_Name[page];
			xChange2 = -xChangeFinish;
		}
		
		//If typing is done
		if draw_char == text_length[page] {
			//Next Page
			if page < page_number - 1 {
				page++;
				draw_char = 0;
			} else {
				setupComplete = true;
			}
		}
	} else if wrist_key && draw_char == text_length[page] && option_number == 0 && global.ForceLine == false {
		//Next Page
		if page < page_number - 1 {
			page++;
			draw_char = 0;
		} else {
			setupComplete = true;
		}
	} else if wrist_key && draw_char == text_length[page] && global.ForceLine == false {
		//Next Page
		if page < page_number - 1 && option_number != 0 {
			page++;
			draw_char = 0;
		}
	}
}


//Drawing the actual textbox
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;

txtb_img += txtb_img_spd;


//Stop Speaker Xs
if xChange >= xChangeFinish {
	xChange = xChangeFinish;
}

if xChange2 <= -xChangeFinish {
	xChange2 = -xChangeFinish;
}

//Speaker X Bullshit
if speaker2Char[page] == false {
	//Speaker 1
	if xChange < xChangeFinish && !setupComplete && speakerChecker == speaker_Name[page] {
		xChange += 20;
	}

	if speakerChecker != speaker_Name[page] {
		if xChange > -xChangeStart {
			xChange -= 20;
		} else if xChange <= -xChangeStart {
			speakerChecker = speaker_Name[page];
			sprite_index = speaker_sprite[page];
		}
	} else {
		if sprite_index != speaker_sprite[page] {
			sprite_index = speaker_sprite[page];
			increaseY = true;
		}
	}
} else {
	//Speaker 2
	if xChange2 > -xChangeFinish && !setupComplete && speakerChecker2 == speaker_Name[page] {
		xChange2 -= 20;
	}

	if speakerChecker2 != speaker_Name[page] {
		if xChange2 < xChangeStart {
			xChange2 += 20;
		} else if xChange2 >= xChangeStart {
			speakerChecker2 = speaker_Name[page];
			_speakerChar = speaker_sprite[page];
		}
	} else {
		if _speakerChar != speaker_sprite[page] {
			_speakerChar = speaker_sprite[page];
			increaseY = true;
		}
	}
}


//Reset positions after text is done.
if setupComplete {
	if xChange > -xChangeStart {
		xChange -= 20;
	}
	
	if xChange2 < xChangeStart {
		xChange2 += 20;
	}
}


//Draw speaker
if speaker_sprite[page] != noone && speaker2Char[page] == false {
	if draw_char == text_length[page] {image_index = 0};
}


//Draw 2nd Speaker
if speaker_sprite[page] != noone && speaker2Char[page] == true {
	if draw_char == text_length[page] {image_index = 0};
}


//Set Character Color
if speaker2Char[page] == false {
	if _charCol < 1 {
		_charCol += 0.05;
	}
	 
	if _charCol2 > 0.75 {
		_charCol2 -= 0.05; 
	}
} else {
	if _charCol > 0.75 {
		_charCol -= 0.05;
	}
	 
	if _charCol2 < 1 {
		_charCol2 += 0.05; 
	}
}


//Apply Gravity
if !increaseY {
	if yChange < 0 {
		yChange += grav;
	} else if yChange >= 0 {
		yChange = 0;
	}

	if yChange2 < 0 {
		yChange2 += grav;
	} else if yChange2 >= 0 {
		yChange2 = 0;
	}
} else {
	if !speaker2Char[page] {
		if yChange > yingEverywhere {
			yChange -= grav;
		} else if yChange <= yingEverywhere {
			increaseY = false;
		}
	} else {
		if yChange2 > yingEverywhere {
			yChange2 -= grav;
		} else if yChange2 <= yingEverywhere {
			increaseY = false;
		}
	}
}


//Draw actual speaker
var _speaker_x = textbox_x + xChange;

draw_sprite_ext(sprite_index, image_index, _speaker_x + 100, textbox_y + 15 + yChange, 0.25, 0.25, 0, c_white, _charCol);


//Draw actual speaker 2
var _speaker2_x = textbox_x + xChange2;
	
draw_sprite_ext(_speakerChar, image_index, _speaker2_x + 540, textbox_y + 15 + yChange2, -0.25, 0.25, 0, c_white, _charCol2);


//Go up on confirm
if textboxYChange > 0 {
	textboxYChange -= 1;
} else if textboxYChange <= 0 {
	textboxYChange = 0;
}


//Back of textbox
draw_sprite_ext(spr_TextboxHead, 0, _txtb_x, _txtb_y + textboxYChange, starterText_Width/txtb_spr_w + 0.15, textbox_height/txtb_spr_h, 0, c_white, 1);
draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y + textboxYChange, starterText_Width/txtb_spr_w + 0.15, textbox_height/txtb_spr_h, 0, c_white, 0.5);
draw_sprite_ext(spr_TextboxTrans, 0, _txtb_x, _txtb_y + textboxYChange, starterText_Width/txtb_spr_w + 0.15, textbox_height/txtb_spr_h, 0, c_white, 1);



//Options
up_key = up_Key_Once;
down_key = down_Key_Once;

if draw_char == text_length[page] && page == page_number - 1 {
	//Option selection
	option_pos += down_key - up_key;
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	if (down_Key_Once or up_Key_Once) && !clamp(option_pos, 0, option_number - 1) {
		obj_SFXManager.menuTap = true;
	}
	
	
	//Drawing options
	var _op_space = 30;
	var _op_bord = 8;
	
	for(var op = 0; op < option_number; op++;) {
		//Option box
		var _o_w = string_width(option[op]) + _op_bord * 2;
		
		draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + 370, _txtb_y - _op_space * option_number + _op_space * op - 3, _o_w/txtb_spr_w, (_op_space - 2)/txtb_spr_h + 0.05, 0, c_white, 1);
		
		//Draw Cursor
		if option_pos == op {
			draw_sprite_ext(spr_CursorHead, image_index / 6, _txtb_x + 320, _txtb_y - 15 - _op_space * option_number + _op_space * op + 5, 0.75, 0.75, 0, c_white, 1);
		}
		
		//Option text
		draw_text(_txtb_x + 370 + _op_bord, _txtb_y - 4 - _op_space * option_number + _op_space * op + 2, option[op]);
	}
		
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
	
	var _camX = camera_get_view_x(view_camera[0]);
	var _camY = camera_get_view_y(view_camera[0]);
	
	//The text
	draw_text_transformed_color(_camX + 47 + char_x[c, page] - 10 + _shake_x, _camY + 331 + char_y[c, page] - 17 + _float_y + _shake_y, char[c, page], text_Size[c, page], text_Size[c, page], 0, col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], text_Alpha[c, page]);
	
	//Character Name
	draw_set_halign(fa_center);
		sprTextbox = txtb_spr[page];
	
		if !speaker2Char[page] {
			if speakerChecker == speaker_Name[page] && (speakerChecker != "No One") {
				draw_sprite_ext(sprTextbox, txtb_img, _txtb_x + 190, _txtb_y - 32, 5, 1, 0, c_grey, 1);
				draw_sprite_ext(spr_TextboxTrans, 0, _txtb_x + 190, _txtb_y - 32, 5, 1, 0, c_white, 1);
				draw_text(_txtb_x + 200 + 70, _txtb_y - 32 + 4, string(speakerChecker));
			}
		} else {
			if speakerChecker2 == speaker_Name[page] && (speakerChecker2 != "No One") {
				draw_sprite_ext(sprTextbox, txtb_img, _txtb_x + 190, _txtb_y - 32, 5, 1, 0, c_grey, 1);
				draw_sprite_ext(spr_TextboxTrans, 0, _txtb_x + 190, _txtb_y - 32, 5, 1, 0, c_white, 1);
				draw_text(_txtb_x + 200 + 70, _txtb_y - 32 + 4, string(speakerChecker2));
			}
		}
	draw_set_halign(fa_left);
}


