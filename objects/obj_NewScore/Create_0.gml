
sprColor = global.colRed;

colRed = global.colRed;
colOrange = global.colOrange;
colYellow = global.colYellow;
colGreen = global.colGreen;
colBlue = global.colBlue;
colPurple = global.colPurple;
colPink = global.colPink;

if !global.MIND && global.PlayerChar != 0 {
	colArray = [
		global.colRed,
		global.colOrange,
		global.colYellow,
		global.colGreen,
		global.colBlue,
		global.colPurple,
		global.colPink,
		global.colRed,
		global.colOrange,
		global.colYellow,
		global.colGreen,
		global.colBlue,
		global.colPurple,
		global.colPink,
		global.colRed,
		global.colOrange,
		global.colYellow,
		global.colGreen,
		global.colBlue,
		global.colPurple,
		global.colPink,
		global.colRed,
		global.colOrange,
		global.colYellow,
		global.colGreen,
		global.colBlue,
	]
} else {
	colArray = [
		c_white,
		#CCCCCC,
		#BBBBBB,
		#999999,
		#777777,
		#555555,
		#333333,
		c_white,
		#CCCCCC,
		#BBBBBB,
		#999999,
		#777777,
		#555555,
		#333333,
		c_white,
		#CCCCCC,
		#BBBBBB,
		#999999,
		#777777,
		#555555,
		#333333,
		c_white,
		#CCCCCC,
		#BBBBBB,
		#999999,
		#777777,
	]
}

colNum = 0;

colorTimer = 0;
colorFrames = 10;


jspd = 0;

_camX = 325;
_camY = 230;

x = -1000000;

depth = 1;

visible = false;