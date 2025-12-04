//Variables
xspd = 0;
yspd = 0;

move_spd = 5;
fast_spd = 1.5;

canMove = true;

depth = -200000000;

image_speed = 0;

preMouseX = 0;
preMouseY = 0;



if room == rm_TitleNormal or room == rm_Freeplay or (room == rm_FileSelect && file_exists(string(global.PastMindDataFile) + ".sav")) {
	normalCursor = spr_MCursorNormal;
	confirmCursor = spr_MCursorConfirm;
} else {
	normalCursor = spr_MCursorHead;
	confirmCursor = spr_MCursorHeadConfirm;
}

sprite_index = normalCursor;

if global.PlayerChar > 0 {
	image_index = global.PlayerChar - 1;
} else {
	image_index = 0;
}
