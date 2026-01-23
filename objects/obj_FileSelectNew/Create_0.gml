fileChoice = 0;
fileMove = 0;

fileChosen = false;
confirm = false;

copy = false;
copying = false;

erase = false;
erasing = false;

chooseTimer = 0;
chooseFrames = 12;

ballXScale = 1;
ballAngle = 1200;

var _dir = working_directory + "/saves/";

if file_exists(_dir + string(global.PastMindDataFile) + ".sav") {
	srSpikes = spr_SonicRushSpikesNorm
} else {
	srSpikes = spr_SonicRush_Spikes_Head;
	sprite_index = spr_SonicRushBGHead;
}

srSpikeFrames = 0;

global.FileInfos = [
	{ //File 1
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 2
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 3
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 4
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 5
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 6
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 7
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
]