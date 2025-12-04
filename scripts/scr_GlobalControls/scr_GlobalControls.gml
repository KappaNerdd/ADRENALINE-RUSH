function scr_GlobalControls() {
	
	//Change Control
	changeBind = false;
	changeBindTimer = 0;
	changeBindFrames = 15;
	
	remappedBind = 0;
	remappedButton = 0;
	keyToRemap = 0;
	
	keyText = "";
		
	//Sprite index
	sprKeyInd = 0;
	sprConInd = 0;
	

		//Keyboard
		sprite = spr_KeyboardBinds;
		
		
		//Movement
		left = 0;
		right = 1;
		up = 2;
		down = 3;
		
		
		//Numbers
		num1 = 4;
		num2 = 5;
		num3 = 6;
		num4 = 7;
		num5 = 8;
		num6 = 9;
		num7 = 10;
		num8 = 11;
		num9 = 12;
		num0 = 13;
		
		
		//Alphabet
		alphA = 14;
		alphB = 15;
		alphC = 16;
		alphD = 17;
		alphE = 18;
		alphF = 19;
		alphG = 20;
		
		alphH = 21;
		alphI = 22;
		alphJ = 23;
		alphK = 24;
		
		alphL = 25;
		alphM = 26;
		alphN = 27;
		alphO = 28;
		alphP = 29;
		
		alphQ = 30;
		alphR = 31;
		alphS = 32;
		
		alphT = 33;
		alphU = 34;
		alphV = 35;
		
		alphW = 36;
		alphX = 37;
		alphY = 38;
		alphZ = 39;
		
		
		//Punctuation
		punctLBrac = 40;
		punctRBrac = 41;
		punctBSlash = 42;
		punctFSlash = 43;
		
		punctPeriod = 44;
		punctComma = 45;
		punctSemiColon = 46;
		punctApostrophe = 47;
		
		punctMinus = 48;
		punctEqual = 49;
		
		punctBQuote = 50;
		
		
		//Special
		rAlt = 51;
		rCtrl = 52;
		enter = 53;
		space = 54;
		backspace = 55;
		
		lShift = 56;
		rShift = 57;
		lCtrl = 58;
		lAlt = 59;
		tab = 60;
		
		
		//F
		fF1 = 61;
		fF2 = 62;
		fF3 = 63;
		fF4 = 64;
		fF5 = 65;
		fF6 = 66;
		fF7 = 67;
		fF8 = 68;
		fF9 = 69;
		fF10 = 70;
		fF11 = 71;
		fF12 = 72;
		
		
		//Escape
		escape = 73;
		
		if global.ConType == 0 {
			//Xbox
			sprite = spr_XboxBinds;
		} else if global.ConType == 1 {
			//PS
			sprite = spr_PSBinds;
		} else if global.ConType == 2 {
			//Switch
			sprite = spr_SwitchBinds;
		}
		
		//Sticks
		lStickBut = 0;
		rStickBut = 1;
			
			
		//D-Pad
		padLeft = 2;
		padRight = 3;
		padUp = 4;
		padDown = 5;
		
		
		//Faces
		face1 = 6;
		face2 = 7;
		face3 = 8;
		face4 = 9;
		
		
		//Shoulders
		shouldLB = 10;
		shouldRB = 11;
		shouldLT = 12;
		shouldRT = 13;
		
		
		//Start & Select
		butStart = 14;
		butSelect = 15;
}



function scr_SetControl() {
	if changeBind {
		if changeBindTimer > 0 {
			changeBindTimer -= 1;
		}
	} else {
		changeBindTimer = changeBindFrames;
	}
	
	if changeBind && changeBindTimer <= 0 {
		if !gamepad_is_connected(global.Player1Con) {
			if keyboard_check_pressed(vk_anykey) {
				remappedBind = keyboard_lastkey;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			}
		} else {
			//Faces
			if gamepad_button_check_pressed(global.Player1Con, gp_face1) {
				remappedBind = gp_face1;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_face2) {
				remappedBind = gp_face2;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_face3) {
				remappedBind = gp_face3;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_face4) {
				remappedBind = gp_face4;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			}
			
			
			//Pad
			if gamepad_button_check_pressed(global.Player1Con, gp_padu) {
				remappedBind = gp_padu;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_padd) {
				remappedBind = gp_padd;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_padl) {
				remappedBind = gp_padl;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_padr) {
				remappedBind = gp_padr;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			}
			
			
			//Sticks
			if gamepad_button_check_pressed(global.Player1Con, gp_stickl) {
				remappedBind = gp_stickl;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_stickr) {
				remappedBind = gp_stickr;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			}
			
			
			//Shoulders
			if gamepad_button_check_pressed(global.Player1Con, gp_shoulderl) {
				remappedBind = gp_shoulderl;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_shoulderr) {
				remappedBind = gp_shoulderr;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_shoulderlb) {
				remappedBind = gp_shoulderlb;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_shoulderrb) {
				remappedBind = gp_shoulderrb;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			}
			
			
			//Starts
			if gamepad_button_check_pressed(global.Player1Con, gp_start) {
				remappedBind = gp_start;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			} else if gamepad_button_check_pressed(global.Player1Con, gp_select) {
				remappedBind = gp_select;
				
				waiting = true;
				
				obj_SFXManager.funkinFav = true;
			}
		}
		
		if waiting {
			waitTimer -= 1;
		}
		
		if waitTimer <= 0 {
			waiting = false;
			changeBind = false;
		}
	} else {
		waitTimer = waitFrames;
	}
	
}


function scr_ChangeControlSprites() {
	if changeBind {
		if !gamepad_is_connected(global.Player1Con) {
			
			if keyboard_check_pressed(vk_left) {
				sprKeyInd = left;
			} else if keyboard_check_pressed(vk_right) {
				sprKeyInd = right;
			} else if keyboard_check_pressed(vk_up) {
				sprKeyInd = up;
			} else if keyboard_check_pressed(vk_down) {
				sprKeyInd = down;
			}
			
			
			if keyboard_check_pressed(ord("1")) {
				sprKeyInd = num1;
			} else if keyboard_check_pressed(ord("2")) {
				sprKeyInd = num2;
			} else if keyboard_check_pressed(ord("3")) {
				sprKeyInd = num3;
			} else if keyboard_check_pressed(ord("4")) {
				sprKeyInd = num4;
			} else if keyboard_check_pressed(ord("5")) {
				sprKeyInd = num5;
			} else if keyboard_check_pressed(ord("6")) {
				sprKeyInd = num6;
			} else if keyboard_check_pressed(ord("7")) {
				sprKeyInd = num7;
			} else if keyboard_check_pressed(ord("8")) {
				sprKeyInd = num8;
			} else if keyboard_check_pressed(ord("9")) {
				sprKeyInd = num9;
			} else if keyboard_check_pressed(ord("0")) {
				sprKeyInd = num0;
			}
			
			
			if keyboard_check_pressed(ord("A")) {
				sprKeyInd = alphA;
			} else if keyboard_check_pressed(ord("B")) {
				sprKeyInd = alphB;
			} else if keyboard_check_pressed(ord("C")) {
				sprKeyInd = alphC;
			} else if keyboard_check_pressed(ord("D")) {
				sprKeyInd = alphD;
			} else if keyboard_check_pressed(ord("E")) {
				sprKeyInd = alphE;
			} else if keyboard_check_pressed(ord("F")) {
				sprKeyInd = alphF;
			} else if keyboard_check_pressed(ord("G")) {
				sprKeyInd = alphG;
			}
			
			if keyboard_check_pressed(ord("H")) {
				sprKeyInd = alphH;
			} else if keyboard_check_pressed(ord("I")) {
				sprKeyInd = alphI;
			} else if keyboard_check_pressed(ord("J")) {
				sprKeyInd = alphJ;
			} else if keyboard_check_pressed(ord("K")) {
				sprKeyInd = alphK;
			}
			
			if keyboard_check_pressed(ord("L")) {
				sprKeyInd = alphL;
			} else if keyboard_check_pressed(ord("M")) {
				sprKeyInd = alphM;
			} else if keyboard_check_pressed(ord("N")) {
				sprKeyInd = alphN;
			} else if keyboard_check_pressed(ord("O")) {
				sprKeyInd = alphO;
			} else if keyboard_check_pressed(ord("P")) {
				sprKeyInd = alphP;
			}
			
			if keyboard_check_pressed(ord("Q")) {
				sprKeyInd = alphQ;
			} else if keyboard_check_pressed(ord("R")) {
				sprKeyInd = alphR;
			} else if keyboard_check_pressed(ord("S")) {
				sprKeyInd = alphS;
			}
			
			if keyboard_check_pressed(ord("T")) {
				sprKeyInd = alphT;
			} else if keyboard_check_pressed(ord("U")) {
				sprKeyInd = alphU;
			} else if keyboard_check_pressed(ord("V")) {
				sprKeyInd = alphV;
			}
			
			if keyboard_check_pressed(ord("W")) {
				sprKeyInd = alphW;
			} else if keyboard_check_pressed(ord("X")) {
				sprKeyInd = alphX;
			} else if keyboard_check_pressed(ord("Y")) {
				sprKeyInd = alphY;
			} else if keyboard_check_pressed(ord("Z")) {
				sprKeyInd = alphZ;
			}
			
			
			if keyboard_check_pressed(ord("[")) {
				sprKeyInd = punctLBrac;
			} else if keyboard_check_pressed(ord("]")) {
				sprKeyInd = punctRBrac;
			} else if keyboard_check_pressed(ord("\\")) {
				sprKeyInd = punctBSlash;
			} else if keyboard_check_pressed(ord("/")) {
				sprKeyInd = punctFSlash;
			}
			
			
			if keyboard_check_pressed(ord(".")) {
				sprKeyInd = punctPeriod;
			} else if keyboard_check_pressed(ord(",")) {
				sprKeyInd = punctComma;
			} else if keyboard_check_pressed(ord(";")) {
				sprKeyInd = punctSemiColon;
			} else if keyboard_check_pressed(ord("'")) {
				sprKeyInd = punctApostrophe;
			}
			
			
			if keyboard_check_pressed(ord("-")) {
				sprKeyInd = punctMinus;
			} else if keyboard_check_pressed(ord("=")) {
				sprKeyInd = punctEqual;
			} else if keyboard_check_pressed(ord("`")) {
				sprKeyInd = punctBQuote;
			}
			
			
			if keyboard_check_pressed(vk_ralt) {
				sprKeyInd = rAlt;
			} else if keyboard_check_pressed(vk_rcontrol) {
				sprKeyInd = rCtrl;
			} else if keyboard_check_pressed(vk_enter) {
				sprKeyInd = enter;
			} else if keyboard_check_pressed(vk_space) {
				sprKeyInd = space;
			} else if keyboard_check_pressed(vk_backspace) {
				sprKeyInd = backspace;
			}
			
			
			if keyboard_check_pressed(vk_shift) {
				sprKeyInd = lShift;
			} else if keyboard_check_pressed(vk_rshift) {
				sprKeyInd = rShift;
			} else if keyboard_check_pressed(vk_alt) {
				sprKeyInd = lAlt;
			} else if keyboard_check_pressed(vk_control) {
				sprKeyInd = lCtrl;
			} else if keyboard_check_pressed(vk_tab) {
				sprKeyInd = tab;
			}
			
			
			if keyboard_check_pressed(vk_f1) {
				sprKeyInd = fF1;
			} else if keyboard_check_pressed(vk_f2) {
				sprKeyInd = fF2;
			} else if keyboard_check_pressed(vk_f3) {
				sprKeyInd = fF3;
			} else if keyboard_check_pressed(vk_f4) {
				sprKeyInd = fF4;
			} else if keyboard_check_pressed(vk_f5) {
				sprKeyInd = fF5;
			} else if keyboard_check_pressed(vk_f6) {
				sprKeyInd = fF6;
			} else if keyboard_check_pressed(vk_f7) {
				sprKeyInd = fF7;
			} else if keyboard_check_pressed(vk_f8) {
				sprKeyInd = fF8;
			} else if keyboard_check_pressed(vk_f9) {
				sprKeyInd = fF9;
			} else if keyboard_check_pressed(vk_f10) {
				sprKeyInd = fF10;
			} else if keyboard_check_pressed(vk_f11) {
				sprKeyInd = fF11;
			} else if keyboard_check_pressed(vk_f12) {
				sprKeyInd = fF12;
			}
			
			
			if keyboard_check_pressed(vk_escape) {
				sprKeyInd = escape;
			}
			
		} else {
			
			if gamepad_button_check_pressed(0, gp_stickl) {
				sprConInd = lStickBut;
			} else if gamepad_button_check_pressed(0, gp_stickr) {
				sprConInd = rStickBut;
			}
			
			
			if gamepad_button_check_pressed(0, gp_padl) {
				sprConInd = padLeft;
			} else if gamepad_button_check_pressed(0, gp_padr) {
				sprConInd = padRight;
			} else if gamepad_button_check_pressed(0, gp_padu) {
				sprConInd = padUp;
			} else if gamepad_button_check_pressed(0, gp_padd) {
				sprConInd = padDown;
			}
			
			
			if gamepad_button_check_pressed(0, gp_face1) {
				sprConInd = face1;
			} else if gamepad_button_check_pressed(0, gp_face2) {
				sprConInd = face2;
			} else if gamepad_button_check_pressed(0, gp_face3) {
				sprConInd = face3;
			} else if gamepad_button_check_pressed(0, gp_face4) {
				sprConInd = face4;
			}
			
			
			if gamepad_button_check_pressed(0, gp_shoulderl) {
				sprConInd = shouldLB;
			} else if gamepad_button_check_pressed(0, gp_shoulderlb) {
				sprConInd = shouldLT;
			} else if gamepad_button_check_pressed(0, gp_shoulderr) {
				sprConInd = shouldRB;
			} else if gamepad_button_check_pressed(0, gp_shoulderrb) {
				sprConInd = shouldRT;
			}
			
			
			if gamepad_button_check_pressed(0, gp_start) {
				sprConInd = butStart;
			} else if gamepad_button_check_pressed(0, gp_select) {
				sprConInd = butSelect;
			}
			
		}
	}
}