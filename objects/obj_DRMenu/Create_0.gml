depth = -1;

menus = [
	["dr_Items", spr_TextboxHead],
	["dr_Equip", spr_LoneTextbox],
	["dr_Power", spr_RoxxaneTextbox],
	["title_Options", spr_CloeeTextbox],
]

menuCount = array_length(menus);

menuDone = false;

moveTimer = 1;
moveFrames = 15;

menuChoice = 0;

menuTimer = 0;

for(var i = 0; i < menuCount; i++) {
    menuX[i] = -200;
    menuDelay[i] = 10 * i;
}

charX = 0;

//menuX = 0;
menuY = 100;

soulSpr = global.DRPlayerID.soulSpr[SOUL.IDLE];

soulX = scr_GetCharCamX();
soulY = scr_GetCharCamY();

tarSOULX = 0;
tarSOULY = 0;

item = false;
itemUseChoice = 0;
itemChoice = 0;
itemPlayerChoice = 0;

equip = false;
equipPlayerChoice = 0;
equipUseChoice = 0;
equipChoice = 0;

pow = false;
powPlayerChoice = 0;
powChoice = 0;

srSpikesIndex = 0;

scr_SetCharDRMove(false, false, true, true);
scr_DRSOULVFX(global.DRPlayerID, global.DRPlayerID.soulSpr[SOUL.SIL]);