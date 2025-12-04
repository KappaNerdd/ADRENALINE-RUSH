depth = -100;

image_xscale = 10;
image_yscale = 2;


movedX = 0;
movedY = 0;

player = -1;
playerCostume = 0;
playerSprite = spr_StageCharNone;
textboxSpr = spr_TextboxHead;

partner = -1;
partnerCostume = 0;

partner2 = -1;
partner2Costume = 0;

playerName = scr_LocalText("fs_Empty");
seconds = 0;
minutes = 0;
hours = 0;
playHealth = 0;
playExtraLives = 0;

savRM = "";
fileNum = 0;

fileHovered = false;
fileConfirmed = false;

confirmedTimer = 120;
colorTimer = 5;
confirmColor = c_white;
confirming = false;


//Copying
global.copyFile = false;
global.copyingFile = false;
global.copiedFileNum = 0;

global.playerCopy = -1;
global.playerCostumeCopy = 0;
global.playerSpriteCopy = spr_StageCharNone;
global.TextboxSprCopy = spr_TextboxHead;

global.partnerCopy = -1;
global.partnerCostumeCopy = 0;

global.partner2Copy = -1;
global.partner2CostumeCopy = 0;

global.playerNameCopy = scr_LocalText("fs_Empty");
global.secondsCopy = 0;
global.minutesCopy = 0;
global.hoursCopy = 0;
global.playHealthCopy = 0;
global.playExtraLivesCopy = 0;

global.savRMCopy = "";


//Deleting
global.deleteFile = false;
global.deletingFile = false;


scr_GetCharShitCreate();
scr_RoomCheckerCreate();