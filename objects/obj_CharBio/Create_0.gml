depth = -5;

image_speed = 1 - global.SimplifyVFX;

set_song_ingame(mus_Backstreet, 60, 60);
scr_MusicTag();

charStat = [
	"bio_Name", "bio_Age", "bio_Birth",
]

chars = [
	[spr_LevelCardKappaSet, "name_Kappa", 17, "mon_Feb", "24" + scr_LocalText("ind_THAlt"), "bio_Kappa"],
	[spr_LevelCardLuciferSet, "name_Lucifer", 17, "mon_Feb", "24" + scr_LocalText("ind_THAlt"), "bio_Lucifer"],
	[spr_LevelCardSarahSet, "name_Sarah", 16, "mon_Jan", "24" + scr_LocalText("ind_THAlt"), "bio_Sarah"],
	[spr_LevelCardLoneSet, "name_Alone", 14, "mon_Aug", "24" + scr_LocalText("ind_THAlt"), "bio_Lone"],
	[spr_LevelCardBrockSet, "name_Brock", 18, "mon_May", "18" + scr_LocalText("ind_THAlt"), "bio_Brock"],
	[spr_LevelCardNeegiSet, "name_Neegi", 16, "mon_Nov", "5" + scr_LocalText("ind_THAlt"), "bio_Neegi"],
	[spr_LevelCardCloeeSet, "name_Cloee", 16, "mon_Nov", "5" + scr_LocalText("ind_THAlt"), "bio_Cloee"],
	[spr_LevelCardAkiraSet, "name_Akira", 17, "mon_Apr", "21" + scr_LocalText("ind_STAlt"), "bio_Akira"],
	[spr_LevelCardTaylorSet, "name_Taylor", 19, "mon_Aug", "29" + scr_LocalText("ind_THAlt"), "bio_Taylor"],
	[spr_LevelCardAyanaSet, "name_Ayana", 18, "mon_Apr", "30" + scr_LocalText("ind_THAlt"), "bio_Ayana"],
	[spr_LevelCardRoxxaneSet, "name_Roxxane", 18, "mon_Aug", "27" + scr_LocalText("ind_THAlt"), "bio_Roxxane"],
]

charCheck = 0;
shownChar = 0;

charX = 0;

moveTimer = 1;
moveFrames = 15;

moveLeft = false;
moveRight = false;
charAlpha = 1;

leave = false;

r = 0;
g = 0;
b = 0;

boxIndex = 0;
srSpikesIndex = 0;

checkBio = false;
bioAlpha = 0;
bioBoxScale = 0;