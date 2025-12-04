horiFloatAmplitude = 0.05;
horiFloatSpeed = 0.01;
horiFloatingOffset = 0;

floatAmplitude = 0.1;
floatSpeed = 0.01;
floatingOffset = 0;

rotationAmplitude = -0.1;
rotationSpeed = 0.025;
rotationOffset = 0;

xspd = 12;
yspd = 0;


createThingTimer = 0;
createThingFrames = 20;
createThingTimer = createThingFrames;


image_xscale = 0.2;
image_yscale = 0.2;
image_angle = 3;

depth = -18;


scr_GetCharShitCreate();

if global.PartnerChar == -1 {
	instance_destroy();
}