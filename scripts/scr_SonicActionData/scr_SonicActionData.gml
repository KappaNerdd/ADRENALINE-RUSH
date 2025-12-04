// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_SonicActionData() {

	///-----Variables-----///
	
	//Movement
	sonicMspd = 6;
	sonicJspd = -6;
	
	//Power
	sonicAttack = 5;
	sonicDefense = 5;
	

	///-----Sprites-----///
	
	//Movement
	sprSonicIdle = spr_SonicIdle;
	sprSonicRun = spr_SonicWalk;
	sprSonicJump = 0;
	sprSonicDash = 0;
	sprSonicSuperDash = 0;
	
	
	//Normals (I'm just usin' fighting game terminology. It's not gonna fully be like a traditional 2D fighter though.)
	sprSonicJab1 = spr_SonicJab1
	sprSonicJab2 = 0;
	sprSonicJab3 = 0;
	
	//-Air-//
	sprSonicJJab = 0;
	
	
	//Directional
	sprSonic8H = 0;
	sprSonic6H = 0;
	sprSonic2H = 0;
	
	//-Air-//
	sprSonicJ8H = 0;
	sprSonicJ6H = 0;
	sprSonicJ4H = 0;
	sprSonicJ2H = 0;

}