depth = -5;

image_speed = 1 - global.SimplifyVFX;

set_song_ingame(mus_UnwindaBit, 60, 60);
scr_MusicTag();

credDefault = [
	"cred_BaseName",
	"cred_BaseType",
	"cred_BasePos",
	"cred_BaseDesc",
]

creds = [
	[ //Nerd.
		spr_CredNerdPlace, 
		"cred_NerdName",
		"cred_NerdType",
		"cred_NerdPos",
		"cred_NerdDesc",
		[010, 036, 203],
	],
	
	[ //Huisti
		spr_CredHuistiPlace, 
		"cred_HuisName",
		"cred_HuisType",
		"cred_HuisPos",
		"cred_HuisDesc",
		[20, 000, 210],
	],
	
	[ //Brandon
		spr_CredBrandonPlace, 
		"cred_BranName",
		"cred_BranType",
		"cred_BranPos",
		"cred_BranDesc",
		[143, 000, 000],
	],
	
	[ //Ness
		spr_CredNessPlace, 
		"cred_NessName",
		"cred_NessType",
		"cred_NessPos",
		"cred_NessDesc",
		[225, 200, 000],
	],
]

extraCreds = [
	"CrossxOverOG",
	"EkuriMoon",
	"miracle_captors714",
	
	"ThatUnnamedPersonXP",
	"sleeplesscake",
	"Casserole Comix",
	"Hikiyami Moriko Ch",
	"Sonic Retro",
	"DFelipeh",
	"Peyton Burnham",
	"WreckingPrograms",
	"Blobfish",
	
	"Sara Spalding",
	"Aerion",
	"GravityShift Games",
	"nkrapivin",
	"Alejandro Hitti",
	"DragoniteSpam",
	"YellowAfterlife",
	"Ross Manthorp",
]

credCheck = 0;
extraCheck = false;

leave = false;

r = 0;
g = 0;
b = 0;

moveTimer = 1;
moveFrames = 15;
