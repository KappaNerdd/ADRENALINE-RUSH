//Textbox Creation
textbox_width = 600;
starterText_Width = 30;



textX = 210;
textY = 50;

textAlphaTimer = 180;
otherTextAlpha = 1;



textbox_height = 130;
border = 30;
line_sep = 20;
line_width = textbox_width - border * 2;
txtb_img = 0;
xChange = 0;
speakerChecker = "";


if global.SimplifyVFX == true {
	txtb_img_spd = 0;
} else {
	txtb_img_spd = 11 / 60;
}

//The Text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;

draw_char = 0;
text_spd = 0.5;


//Speaker Name
speakerName = "";


//Options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

optionHandSpeed = 0;

setup = false;
setupComplete = false;

//Sound
snd_delay = 2;
snd_count = snd_delay;

//Effects
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 4;