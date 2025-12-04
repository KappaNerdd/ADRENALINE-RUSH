var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if global.DEBUG == true {
	draw_text(_camX + 550, _camY, string(y));
}

draw_sprite_ext(spr_CassetteFastForward, 0, _camX + 570, _camY + 250, 0.5, 0.5, 0, c_white, image_alpha);
draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, _camX + 540, _camY + 320, 1, 1, 0, c_white, image_alpha);


draw_set_halign(fa_center);

draw_sprite_ext(sprite_index, image_index, x, y, 0.5, 0.5, 0, c_white, image_alpha);

draw_text_transformed_color(320, y + 370, "Game created by", 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha);
draw_sprite_ext(spr_NerdSplashHead, image_index, x - 30, y + 400, 0.5, 0.5, 0, c_white, image_alpha);
draw_text_transformed_color(320, y + 470, "I be alone a lil'.", 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha);

draw_sprite_ext(spr_GMSplashHead, image_index, x + 10, y + 800, 0.5, 0.5, 0, c_white, image_alpha);

draw_text_transformed_color(320, y + 1150, "Special Thanks \n--------------- \n \nHuisti - 2 character results animations, \nSpanish (LATAM) translation \n \nNess - Creator of Ivy \n \nPeyton Burnham - A bunch of GM tutorials \n \nWreckingPrograms - General Sonic-like movement tutorials \n \nSara Spalding - Code of after-images from dash tutoral \n \nAerion - Particle System tutorial \n \nSonic Retro - Sonic Physics Guide \nnkrapivin - NekoPresence \n \n \nPlaytesters \n------------ \nakira_nk \nHuisti \nCrossxOverOG \nEkuriMoon \nNess \nmiracle_captors714 \n \n \n \n \n \n \n \n \n \nThank you so much for playing.", 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha);



draw_set_halign(fa_left);