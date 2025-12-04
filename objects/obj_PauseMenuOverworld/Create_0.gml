//Deactivate everything
instance_deactivate_all(true);

//Reactivate SFX & Music & SaveNLoad
instance_activate_object(obj_MusicManager);
instance_activate_object(obj_SFXManager);
instance_activate_object(obj_AmbienceManager);
instance_activate_object(obj_ConRumbleSystem);
instance_activate_object(obj_SaveNLoad);
instance_activate_object(obj_FullScreen);
instance_activate_object(obj_RoomTransParent);
instance_activate_object(obj_ParaBGParent);
instance_activate_object(obj_Solid);

//Create Background
instance_create_depth(x, y, depth, obj_PauseMenuBG);

//Create Character
instance_create_depth(x, y, depth, obj_PauseChar);

depth = -10000000;

image_speed = 1;

target_rm = rm_Empty;

box = spr_TextboxHead;

bg = spr_PauseMenuBGBasic;
bg_Alpha = 0;

xspd = 3;

width = 64;
height = 104;

op_Border = 8;
op_Space = 20;

pos = 0;

menu_Box = spr_TextboxHead;


///-----Pause Menu-----///
option[0, 0] = "Resume";
option[0, 1] = "Options";
option[0, 2] = "Main Menu";
option[0, 3] = "Quit Game";


///-----Options Menu-----///
option[1, 0] = "Audio";
option[1, 1] = "Visual";
option[1, 2] = "Misc";
option[1, 3] = "Back";

//---Audio---//
option[4, 0] = "Master Volume: ";
option[4, 1] = "Music Volume: ";
option[4, 2] = "SFX Volume: ";
option[4, 3] = "Text Volume: ";
option[4, 4] = "Ambiance Volume: ";
option[4, 5] = "Back";

//---Visual---//
option[5, 0] = "Simplify VFX: ";
option[5, 1] = "Screen Shake: ";
option[5, 2] = "Particles: ";
option[5, 3] = "Language: "
option[5, 4] = "Back";

//---Misc---//
option[6, 0] = "Fullscreen: ";
option[6, 1] = "Song Tag: ";
option[6, 2] = "Controller Type: ";
option[6, 3] = "Controller Rumble: ";
option[6, 4] = "Extended Camera: ";
option[6, 5] = "FPS: "
option[6, 6] = "Back";


///-----Main Menu Confirm------///
option[2, 0] = "Yes";
option[2, 1] = "No";


///-----Quit Game Confirm------///
option[3, 0] = "Yes";
option[3, 1] = "No";


op_Length = 0;
menu_Level = 0;