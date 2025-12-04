//Draw the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);


//Dynamically get width and height of menu
var _new_w = 0;
for(var i = 0; i < op_Length; i++) {
	var _op_w = string_width(option[menu_Level, i]);
	_new_w = max(_new_w, _op_w);
}

width = _new_w + op_Border * 2;
height = op_Border * 2 + string_height(option[0, 0]) + (op_Length - 1) * op_Space;

//Menu Placement
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]) + 50;


for(var i = 0; i < op_Length; i++) {
	var _c = c_gray;
	if pos == i {
		_c = c_white
	}
	draw_text_color(x + op_Border, y + op_Border + op_Space * i, option[menu_Level, i], _c, _c, _c, _c, 1);
}

switch(menu_Level) {
	case 4 :
		//Master Volume
		if global.MASTER_VOL == 1 {
			draw_text(x + 150, y + 8, "100%");
		} else if global.MASTER_VOL == 0.9 {
			draw_text(x + 150, y + 8, "90%");
		} else if global.MASTER_VOL == 0.8 {
			draw_text(x + 150, y + 8, "80%");
		} else if global.MASTER_VOL == 0.7 {
			draw_text(x + 150, y + 8, "70%");
		} else if global.MASTER_VOL == 0.6 {
			draw_text(x + 150, y + 8, "60%");
		} else if global.MASTER_VOL == 0.5 {
			draw_text(x + 150, y + 8, "50%");
		} else if global.MASTER_VOL == 0.4 {
			draw_text(x + 150, y + 8, "40%");
		} else if global.MASTER_VOL == 0.3 {
			draw_text(x + 150, y + 8, "30%");
		} else if global.MASTER_VOL == 0.2 {
			draw_text(x + 150, y + 8, "20%");
		} else if global.MASTER_VOL == 0.1 {
			draw_text(x + 150, y + 8, "10%");
		} else if global.MASTER_VOL == 0 {
			draw_text(x + 150, y + 8, "0%");
		}
		
		
		//Music Volume
		if global.MUSIC_VOL == 1 {
			draw_text(x + 130, y + 28, "100%");
		} else if global.MUSIC_VOL == 0.9 {
			draw_text(x + 130, y + 28, "90%");
		} else if global.MUSIC_VOL == 0.8 {
			draw_text(x + 130, y + 28, "80%");
		} else if global.MUSIC_VOL == 0.7 {
			draw_text(x + 130, y + 28, "70%");
		} else if global.MUSIC_VOL == 0.6 {
			draw_text(x + 130, y + 28, "60%");
		} else if global.MUSIC_VOL == 0.5 {
			draw_text(x + 130, y + 28, "50%");
		} else if global.MUSIC_VOL == 0.4 {
			draw_text(x + 130, y + 28, "40%");
		} else if global.MUSIC_VOL == 0.3 {
			draw_text(x + 130, y + 28, "30%");
		} else if global.MUSIC_VOL == 0.2 {
			draw_text(x + 130, y + 28, "20%");
		} else if global.MUSIC_VOL == 0.1 {
			draw_text(x + 130, y + 28, "10%");
		} else if global.MUSIC_VOL == 0 {
			draw_text(x + 130, y + 28, "0%");
		}
		
		
		//SFX Volume
		if global.SFX_VOL == 1 {
			draw_text(x + 120, y + 48, "100%");
		} else if global.SFX_VOL == 0.9 {
			draw_text(x + 120, y + 48, "90%");
		} else if global.SFX_VOL == 0.8 {
			draw_text(x + 120, y + 48, "80%");
		} else if global.SFX_VOL == 0.7 {
			draw_text(x + 120, y + 48, "70%");
		} else if global.SFX_VOL == 0.6 {
			draw_text(x + 120, y + 48, "60%");
		} else if global.SFX_VOL == 0.5 {
			draw_text(x + 120, y + 48, "50%");
		} else if global.SFX_VOL == 0.4 {
			draw_text(x + 120, y + 48, "40%");
		} else if global.SFX_VOL == 0.3 {
			draw_text(x + 120, y + 48, "30%");
		} else if global.SFX_VOL == 0.2 {
			draw_text(x + 120, y + 48, "20%");
		} else if global.SFX_VOL == 0.1 {
			draw_text(x + 120, y + 48, "10%");
		} else if global.SFX_VOL == 0 {
			draw_text(x + 120, y + 48, "0%");
		}
		
		
		//Text Volume
		if global.TEXT_VOL == 1 {
			draw_text(x + 130, y + 68, "100%");
		} else if global.TEXT_VOL == 0.9 {
			draw_text(x + 130, y + 68, "90%");
		} else if global.TEXT_VOL == 0.8 {
			draw_text(x + 130, y + 68, "80%");
		} else if global.TEXT_VOL == 0.7 {
			draw_text(x + 130, y + 68, "70%");
		} else if global.TEXT_VOL == 0.6 {
			draw_text(x + 130, y + 68, "60%");
		} else if global.TEXT_VOL == 0.5 {
			draw_text(x + 130, y + 68, "50%");
		} else if global.TEXT_VOL == 0.4 {
			draw_text(x + 130, y + 68, "40%");
		} else if global.TEXT_VOL == 0.3 {
			draw_text(x + 130, y + 68, "30%");
		} else if global.TEXT_VOL == 0.2 {
			draw_text(x + 130, y + 68, "20%");
		} else if global.TEXT_VOL == 0.1 {
			draw_text(x + 130, y + 68, "10%");
		} else if global.TEXT_VOL == 0 {
			draw_text(x + 130, y + 68, "0%");
		}
		
		
		//Ambience Volume
		if global.AMBIENCE_VOL == 1 {
			draw_text(x + 165, y + 88, "100%");
		} else if global.AMBIENCE_VOL == 0.9 {
			draw_text(x + 165, y + 88, "90%");
		} else if global.AMBIENCE_VOL == 0.8 {
			draw_text(x + 165, y + 88, "80%");
		} else if global.AMBIENCE_VOL == 0.7 {
			draw_text(x + 165, y + 88, "70%");
		} else if global.AMBIENCE_VOL == 0.6 {
			draw_text(x + 165, y + 88, "60%");
		} else if global.AMBIENCE_VOL == 0.5 {
			draw_text(x + 165, y + 88, "50%");
		} else if global.AMBIENCE_VOL == 0.4 {
			draw_text(x + 165, y + 88, "40%");
		} else if global.AMBIENCE_VOL == 0.3 {
			draw_text(x + 165, y + 88, "30%");
		} else if global.AMBIENCE_VOL == 0.2 {
			draw_text(x + 165, y + 88, "20%");
		} else if global.AMBIENCE_VOL == 0.1 {
			draw_text(x + 165, y + 88, "10%");
		} else if global.AMBIENCE_VOL == 0 {
			draw_text(x + 165, y + 88, "0%");
		}
	break;
		
		
	case 5:
		//Simplify VFX
		if global.SimplifyVFX == true {
			draw_text(x + 130, y + 8, "ON");
		} else if global.SimplifyVFX == false {
			draw_text(x + 130, y + 8, "OFF");
		}
		
		
		//Screen Shake
		if global.ScreenShake == true {
			draw_text(x + 145, y + 28, "ON");
		} else if global.ScreenShake == false {
			draw_text(x + 145, y + 28, "OFF");
		}
		
		
		//Particles
		if global.Particles == true {
			draw_text(x + 100, y + 48, "ON");
		} else if global.Particles == false {
			draw_text(x + 100, y + 48, "OFF");
		}
		
		
		//Language
		if global.Language == 1 {
			draw_text(x + 100, y + 68, "English");
		} else if global.Language == 2 {
			draw_text(x + 100, y + 68, "Español");
		}
	break;
		
		
	case 6:	
		//Fullscreen
		if global.FullScreen == true {
			draw_text(x + 115, y + 8, "ON");
		} else if global.FullScreen == false {
			draw_text(x + 115, y + 8, "OFF");
		}
		
		
		//Song Tag
		if global.SongTag == true {
			draw_text(x + 100, y + 28, "ON");
		} else if global.SongTag == false {
			draw_text(x + 100, y + 28, "OFF");
		}
		
		
		//Controller Type
		if global.ConType == 0 {
			draw_text(x + 170, y + 48, "XBOX");
		} else if global.ConType == 1 {
			draw_text(x + 170, y + 48, "PS4");
		} else if global.ConType == 2 {
			draw_text(x + 170, y + 48, "SWITCH");
		}
		
		
		//Controller Rumble
		if global.ConRumble == true {
			draw_text(x + 185, y + 68, "ON");
		} else if global.ConRumble == false {
			draw_text(x + 185, y + 68, "OFF");
		}


		//Extended Camera
		if global.ExtendCamera == true {
			draw_text(x + 185, y + 88, "ON");
		} else if global.ExtendCamera == false {
			draw_text(x + 185, y + 88, "OFF");
		}
		
		
		//FPS
		if global.FPSOn == true {
			draw_text(x + 50, y + 68, "ON");
		} else if global.FPSOn == false {
			draw_text(x + 50, y + 68, "OFF");
		}
	break;
	
	
	//Main Menu
	case 2:
		
		//Are you sure
		draw_text(x + 70, y + 8, "Are you sure \nyou want to \nreturn to the \nmain menu?");
	break;
	
	
	//Quit Game
	case 3:
		
		//Are you sure
		draw_text(x + 70, y + 8, "Are you sure \nyou want to \nquit the game?");
	break;
}