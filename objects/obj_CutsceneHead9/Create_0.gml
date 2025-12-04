with(obj_CameraParent) {
	finalCamX = 460;
	finalCamY = 970;
}

if global.statData[1].head_Overworld9_Check1 {
	instance_destroy();
} else {

	set_song_ingame(noone, 120, 0);

	//This is still gonna be cancerous. So if you're a programmer and reading this rn, I'm so sorry you're seeing
	//the most evil coding ever.


	image_alpha = 0;
	depth = -10000;

	image_xscale = 0.5;
	image_yscale = 0.5;

	text_id = "Pace";

	//Camera move down & move player
	cameraDown = 180;
	camDownConfirmed = false;


	//Wait (Textbox)
	waitStand = 120;
	waitStandConfirmed = false;

	waitTextbox = 120;
	textboxConfirmed = false;


	//After textbox
	afterText = 120;
	afterTextConfirmed = false;

}