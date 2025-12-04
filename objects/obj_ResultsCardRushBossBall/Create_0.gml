depth = obj_ResultsCardChar.depth + 1;

x = camera_get_view_x(view_camera[0]) + 480;
y = camera_get_view_y(view_camera[0]) + 210;


_sprite = spr_CharSelectRushBossBall;

if global.PlayerChar == 0 {
	_sprite = spr_CharSelectRushBossBallHead;
	image_alpha = 0.5;
} else {
	_sprite = spr_CharSelectRushBossBall;
	image_blend = global.fullRGB;
}


ballX = 300;
ballY = -300;

changeBall = 5;

changeAngle = 0;


image_xscale = 2;
image_yscale = 2;

confirmOpacity = 0;