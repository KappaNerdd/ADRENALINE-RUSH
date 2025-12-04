if global.NameConfirm == false {
	draw_text(x - 20, y, scr_LocalText("menu_NameAsk"));
} else {
	if string_lower(global.PlayerName) == "kappa" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "I kinda need that.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = false;
	} else if string_lower(global.PlayerName) == "sarah" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "Hiiiii! :D \nWe can share!", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "rush" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "Talk about no original name.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "blur" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "Daammmnnn. \nSo we dead-namin' now?", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "kappanerd" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "Hey. It's me. The creator, not \nthe character. \nI kinda need this too.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = false;
	} else if string_lower(global.PlayerName) == "kappanerdd" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "I also need this.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = false;
	} else if string_lower(global.PlayerName) == "nerd" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "Yo, uhh, it's me again. \nI need this too.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = false;
	} else if string_lower(global.PlayerName) == "sonic" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "The one that started it all.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "blaze" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "My personal favorite.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "goku" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "A legendary warrior, pure \n of heart.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "gohan" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "Quiet rage of a gentle giant.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "gaster" {
		game_end();
	} else if string_lower(global.PlayerName) == "kris" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "You must enjoy eating crayons.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
		draw_set_font(fnt_DETERMINATION_Mono);
	} else if string_lower(global.PlayerName) == "frisk" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "This WON'T make your life Hell.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
		draw_set_font(fnt_DETERMINATION_Mono);
	} else if string_lower(global.PlayerName) == "chara" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "Not the true name.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
		draw_set_font(fnt_DETERMINATION_Mono);
	} else if string_lower(global.PlayerName) == "sans" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "nope.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = false;
		draw_set_font(fnt_PixelComicSans);
	} else if string_lower(global.PlayerName) == "papyru" or string_lower(global.PlayerName) == "papyrus" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "I'LL ALLOW IT!!!!", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
		draw_set_font(fnt_PixelPAPYRUS);
	} else if string_lower(global.PlayerName) == "ivy" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "A child of justice.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
		draw_set_font(fnt_DETERMINATION_Mono);
	} else if string_lower(global.PlayerName) == "kira" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "\"Not okay.\" \n  - akiraa.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "rae" or string_lower(global.PlayerName) == "red" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "\"All hail King Buford.\" \n  - EkuriMoon", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "chris" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "Kilometer Immorales.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "huisti" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "The local furry in the \nneighborhood.", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "antho" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "\"A huge blue hedgehog nerd.\" \n  - AnthoSFG1235", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "ness" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "\"Sorry. My pronouns are DLC.\" \n  - Ness", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "yub" or string_lower(global.PlayerName) == "yubboi" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "\"Have a bye-five!\" \n  - YuB", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "manly" or string_lower(global.PlayerName) == "manlybadasshero" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "\"Anime.\" \n  - ManlyBadassHero", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "coryxkenshin" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "SAMURAI, STAND UP!", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	} else if string_lower(global.PlayerName) == "transrights" or string_lower(global.PlayerName) == "trans rights" {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "YEAH! \nLET'S FUCKIN' GO!", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	}  else {
		draw_text_color(camera_get_view_x(view_camera[0]) + 150, camera_get_view_y(view_camera[0]) + 30, "Is this name correct?", c_white, c_white, c_white, c_white, image_alpha);
		global.NameAllowed = true;
	}
}

if global.NameConfirm == false {
	draw_text_transformed(x, y + 50, string(global.PlayerName), image_xscale, image_yscale, 0);
} else {
	draw_text_transformed(x, y + 50, string(global.PlayerName), image_xscale, image_yscale, random_range(-1, 2));
}