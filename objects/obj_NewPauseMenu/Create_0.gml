//Play Sound
obj_SFXManager.pauseMenuSplash = true;
gamepad_set_vibration(0, 0, 0);

//Deactivate everything
instance_deactivate_all(true);

//Reactivate some other shit
instance_activate_object(obj_PROTOTYPEMessage);
instance_activate_object(obj_Debug);
instance_activate_object(obj_Settings);
instance_activate_object(obj_GlobalControls);
instance_activate_object(obj_MusicManager);
instance_activate_object(obj_SFXManager);
instance_activate_object(obj_AmbienceManager);
instance_activate_object(obj_ConRumbleSystem);
instance_activate_object(obj_SaveNLoad);
instance_activate_object(obj_FullScreen);
instance_activate_object(obj_RoomTransParent);
instance_activate_object(obj_ParaBGParent);
instance_activate_object(obj_Solid);
instance_activate_object(obj_StageTrackerSpeed);
instance_activate_object(obj_NekoPresenceDemo);
instance_activate_object(obj_ControllerSystem);

instance_activate_object(obj_CustomLeftKeySpeed);
instance_activate_object(obj_CustomRightKeySpeed);
instance_activate_object(obj_CustomUpKeySpeed);
instance_activate_object(obj_CustomDownKeySpeed);
instance_activate_object(obj_CustomJumpKeySpeed);
instance_activate_object(obj_CustomAct1KeySpeed);
instance_activate_object(obj_CustomAct2KeySpeed);
instance_activate_object(obj_CustomAct3KeySpeed);
instance_activate_object(obj_CustomAct4KeySpeed);
instance_activate_object(obj_CustomAct5KeySpeed);
instance_activate_object(obj_CustomPauseKeySpeed);
instance_activate_object(obj_CustomSelectKeySpeed);


//Create some bullshit
instance_create_depth(camera_get_view_x(view_camera[0]) + 384, camera_get_view_y(view_camera[0]) + 216, depth, obj_PauseCursor);

instance_create_depth(camera_get_view_x(view_camera[0]) - 16, camera_get_view_y(view_camera[0]) - 40, depth, obj_BorderV);
instance_create_depth(camera_get_view_x(view_camera[0]) + 768, camera_get_view_y(view_camera[0]) - 40, depth, obj_BorderV);
instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) - 16, depth, obj_BorderH);
instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 432, depth, obj_BorderH);

instance_create_depth(x, y, depth, obj_NewPauseChar);
instance_create_depth(x, y, depth, obj_PauseSideBar);
instance_create_depth(x, y, depth, obj_PauseMenuBoxParent);
instance_create_depth(x, y, depth, obj_PauseControls);



x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

depth = -100000000;

image_xscale = 13;
image_yscale = 13;

image_alpha = 0;


if global.PlayerChar == 0 {
	sprite_index = spr_SonicRushBGHead;
} else {
	sprite_index = spr_SonicRushBG;
	image_blend = global.fullRGB;
}


active = true;
inactive = false;


pause = noone;


if global.UniquePauseTheme {
	pause = global.PlayerSelection[global.PlayerChar][21];
}