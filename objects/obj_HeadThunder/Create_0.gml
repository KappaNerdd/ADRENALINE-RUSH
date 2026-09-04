randomize();

extraX = random(global.CamWidth);

image_alpha = 1;

image_xscale = 1;
image_yscale = 3;

depth = random_range(400, -200);

thunderComplete = false;

thunderCrack1 = spr_Thunder1;
thunderCrack2 = spr_Thunder2;
thunderCrack3 = spr_Thunder3;

thunderCol = c_white;

var _thunRandom = ceil(random(3));

if _thunRandom == 1 {
	thunderSpr = thunderCrack1;
	obj_SFXManager.thunder1 = true;
} else if _thunRandom == 2 {
	thunderSpr = thunderCrack2;
	obj_SFXManager.thunder2 = true;
} else if _thunRandom == 3 {
	thunderSpr = thunderCrack3;
	obj_SFXManager.thunder3 = true;
}

alarm_set(0, 5);

global.ThunderOpacity = 0.75;