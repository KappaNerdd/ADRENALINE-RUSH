boost = global.PlayerSelection[global.PlayerChar][18][0];
simpleBoost = global.PlayerSelection[global.PlayerChar][18][1];
fullBoost = global.PlayerSelection[global.PlayerChar][18][0];

image_alpha = 0.5;
depth = obj_Player.depth - 1;
sprite_index = fullBoost;
image_speed = 3;

visible = false;

if obj_Player.vel > 0 {
	image_xscale = 1;
} else if obj_Player.vel < 0 {
	image_xscale = -1;
}