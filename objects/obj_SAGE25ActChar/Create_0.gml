image_xscale = 0.19;
image_yscale = 0.19;

char = 0;
charBio = "";
charBioX = 0;
charBioXScale = 20;

if global.speedStageData[0].complete && global.speedStageData[1].complete && global.speedStageData[2].complete && global.speedStageData[3].complete && global.speedStageData[5].complete && global.speedStageData[8].complete {
	image_blend = c_grey;
} else {
	image_blend = c_black;
}