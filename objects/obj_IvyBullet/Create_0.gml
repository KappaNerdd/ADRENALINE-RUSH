image_yscale = 0.3;

xspd = 0;
yspd = 0;

if obj_Player.ground && obj_Player.shootGround {
	image_angle = 0;
	image_xscale = 1 * obj_Player.image_xscale;
	
	x = obj_Player.x + (10 * obj_Player.image_xscale);
	y = obj_Player.y + 5;
	
	xspd = 7 * obj_Player.image_xscale;
} else if !obj_Player.ground && !obj_Player.hShoot {
	image_angle = -90;
	image_xscale = 1;
	
	x = obj_Player.x;
	y = obj_Player.y + 10;
	
	yspd = 7;
}


xAdd = 0.3 * obj_Player.image_xscale;
yAdd = 0.3;

depth = obj_Player.depth - 1;

shotTimer = 240;

if global.SimplifyVFX {
	image_speed = 0;
}

obj_SFXManager.ivyShoot = true;