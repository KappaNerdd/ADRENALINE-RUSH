draw_self();

var _changeX = x + 500;
var _changeY = y + 120;

var _changeXScale = 0.5;
var _changeYScale = 0.5;


if (obj_CharSelectWhiteBall.playerConfirmed && obj_CharSelectWhiteBall.playerConfirmedTimer >= obj_CharSelectWhiteBall.playerConfirmedFrames - 5) or (obj_CharSelectWhiteBall.partnerConfirmed && obj_CharSelectWhiteBall.partnerConfirmedTimer >= obj_CharSelectWhiteBall.partnerConfirmedFrames - 5) or (obj_CharSelectWhiteBall.partner2Confirmed && obj_CharSelectWhiteBall.partner2ConfirmedTimer >= obj_CharSelectWhiteBall.partner2ConfirmedFrames - 5) {
	confirmOpacity = 1;
}

if confirmOpacity > 0 {
	confirmOpacity -= 0.05;
}

if !global.SimplifyVFX {
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, confirmOpacity);
}


/*Character Descriptions
draw_text_transformed(_changeX, _changeY, "NAME: " + string(charName), _changeXScale, _changeYScale, 0);
draw_text_transformed(_changeX, _changeY + 10, "AGE: " + string(charAge), _changeXScale, _changeYScale, 0);
draw_text_transformed(_changeX, _changeY + 20, "Description: \n" + string(charDesc), _changeXScale, _changeYScale, 0);