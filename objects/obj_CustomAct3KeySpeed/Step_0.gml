var _conCheck = global.Action2KeySpeed;

if !gamepad_is_connected(global.Player1Con) {
	_conCheck = global.Action2KeySpeed;
	sprite = spr_KeyboardBinds;
	image_index = sprKeyInd;
	
			if _conCheck == vk_left {
				sprKeyInd = left;
				keyText = "[" + scr_LocalText("opt_ConLeft") + "]";
			} else if _conCheck == vk_right {
				sprKeyInd = right;
				keyText = "[" + scr_LocalText("opt_ConRight") + "]";
			} else if _conCheck == vk_up {
				sprKeyInd = up;
				keyText = "[" + scr_LocalText("opt_ConUp") + "]";
			} else if _conCheck == vk_down {
				sprKeyInd = down;
				keyText = "[" + scr_LocalText("opt_ConDown") + "]";
			} else
			
			
			if _conCheck == "1" or _conCheck == ord("1") {
				sprKeyInd = num1;
				keyText = "[1]";
			} else if _conCheck == "2" or _conCheck == ord("2") {
				sprKeyInd = num2;
				keyText = "[2]";
			} else if _conCheck == "3" or _conCheck == ord("3") {
				sprKeyInd = num3;
				keyText = "[3]";
			} else if _conCheck == "4" or _conCheck == ord("4") {
				sprKeyInd = num4;
				keyText = "[4]";
			} else if _conCheck == "5" or _conCheck == ord("5") {
				sprKeyInd = num5;
				keyText = "[5]";
			} else if _conCheck == "6" or _conCheck == ord("6") {
				sprKeyInd = num6;
				keyText = "[6]";
			} else if _conCheck == "7" or _conCheck == ord("7") {
				sprKeyInd = num7;
				keyText = "[7]";
			} else if _conCheck == "8" or _conCheck == ord("8") {
				sprKeyInd = num8;
				keyText = "[8]";
			} else if _conCheck == "9" or _conCheck == ord("9") {
				sprKeyInd = num9;
				keyText = "[9]";
			} else if _conCheck == "0" or _conCheck == ord("0") {
				sprKeyInd = num0;
				keyText = "[0]";
			} else
			
			
			if _conCheck == "A" or _conCheck == ord("A") {
				sprKeyInd = alphA;
				keyText = "[A]";
			} else if _conCheck == "B" or _conCheck == ord("B") {
				sprKeyInd = alphB;
				keyText = "[B]";
			} else if _conCheck == "C" or _conCheck == ord("C") {
				sprKeyInd = alphC;
				keyText = "[C]";
			} else if _conCheck == "D" or _conCheck == ord("D") {
				sprKeyInd = alphD;
				keyText = "[D]";
			} else if _conCheck == "E" or _conCheck == ord("E") {
				sprKeyInd = alphE;
				keyText = "[E]";
			} else if _conCheck == "F" or _conCheck == ord("F") {
				sprKeyInd = alphF;
				keyText = "[F]";
			} else if _conCheck == "G" or _conCheck == ord("G") {
				sprKeyInd = alphG;
				keyText = "[G]";
			} else
			
			if _conCheck == "H" or _conCheck == ord("H") {
				sprKeyInd = alphH;
				keyText = "[H]";
			} else if _conCheck == "I" or _conCheck == ord("I") {
				sprKeyInd = alphI;
				keyText = "[I]";
			} else if _conCheck == "J" or _conCheck == ord("J") {
				sprKeyInd = alphJ;
				keyText = "[J]";
			} else if _conCheck == "K" or _conCheck == ord("K") {
				sprKeyInd = alphK;
				keyText = "[K]";
			} else
			
			if _conCheck == "L" or _conCheck == ord("L") {
				sprKeyInd = alphL;
				keyText = "[L]";
			} else if _conCheck == "M" or _conCheck == ord("M") {
				sprKeyInd = alphM;
				keyText = "[M]";
			} else if _conCheck == "N" or _conCheck == ord("N") {
				sprKeyInd = alphN;
				keyText = "[N]";
			} else if _conCheck == "O" or _conCheck == ord("O") {
				sprKeyInd = alphO;
				keyText = "[O]";
			} else if _conCheck == "P" or _conCheck == ord("P") {
				sprKeyInd = alphP;
				keyText = "[P]";
			} else
			
			if _conCheck == "Q" or _conCheck == ord("Q") {
				sprKeyInd = alphQ;
				keyText = "[Q]";
			} else if _conCheck == "R" or _conCheck == ord("R") {
				sprKeyInd = alphR;
				keyText = "[R]";
			} else if _conCheck == "S" or _conCheck == ord("S") {
				sprKeyInd = alphS;
				keyText = "[S]";
			} else
			
			if _conCheck == "T" or _conCheck == ord("T") {
				sprKeyInd = alphT;
				keyText = "[T]";
			} else if _conCheck == "U" or _conCheck == ord("U") {
				sprKeyInd = alphU;
				keyText = "[U]";
			} else if _conCheck == "V" or _conCheck == ord("V") {
				sprKeyInd = alphV;
				keyText = "[V]";
			} else
			
			if _conCheck == "W" or _conCheck == ord("W") {
				sprKeyInd = alphW;
				keyText = "[W]";
			} else if _conCheck == "X" or _conCheck == ord("X") {
				sprKeyInd = alphX;
				keyText = "[X]";
			} else if _conCheck == "Y" or _conCheck == ord("Y") {
				sprKeyInd = alphY;
				keyText = "[Y]";
			} else if _conCheck == "Z" or _conCheck == ord("Z") {
				sprKeyInd = alphZ;
				keyText = "[Z]";
			} else
			
			
			if _conCheck == "[" or _conCheck == ord("[") {
				sprKeyInd = punctLBrac;
				keyText = "[[]";
			} else if _conCheck == "]" or _conCheck == ord("]") {
				sprKeyInd = punctRBrac;
				keyText = "[]]";
			} else if _conCheck == "\\" or _conCheck == ord("\\") {
				sprKeyInd = punctBSlash;
				keyText = "[\\]";
			} else if _conCheck == "/" or _conCheck == ord("/") {
				sprKeyInd = punctFSlash;
				keyText = "[/]";
			} else
			
			
			if _conCheck == "." or _conCheck == ord(".") {
				sprKeyInd = punctPeriod;
				keyText = "[.]";
			} else if _conCheck == "," or _conCheck == ord(",") {
				sprKeyInd = punctComma;
				keyText = "[,]";
			} else if _conCheck == ";" or _conCheck == ord(";") {
				sprKeyInd = punctSemiColon;
				keyText = "[;]";
			} else if _conCheck == "'" or _conCheck == ord("'") {
				sprKeyInd = punctApostrophe;
				keyText = "[']";
			} else
			
			
			if _conCheck == "-" or _conCheck == ord("-") {
				sprKeyInd = punctMinus;
				keyText = "[-]";
			} else if _conCheck == "=" or _conCheck == ord("=") {
				sprKeyInd = punctEqual;
				keyText = "[=]";
			} else if _conCheck == "`" or _conCheck == ord("`") {
				sprKeyInd = punctBQuote;
				keyText = "[`]";
			} else
			
			
			if _conCheck == vk_ralt {
				sprKeyInd = rAlt;
				keyText = "[R-ALT]";
			} else if _conCheck == vk_rcontrol {
				sprKeyInd = rCtrl;
				keyText = "[R-CTRL]";
			} else if _conCheck == vk_enter {
				sprKeyInd = enter;
				keyText = "[ENTER]";
			} else if _conCheck == vk_space {
				sprKeyInd = space;
				keyText = "[SPACE]";
			} else if _conCheck == vk_backspace {
				sprKeyInd = backspace;
				keyText = "[BKSPC]";
			} else
			
			
			if _conCheck == vk_lshift {
				sprKeyInd = lShift;
				keyText = "[L-SHIFT]";
			} else if _conCheck == vk_rshift {
				sprKeyInd = rShift;
				keyText = "[R-SHIFT]";
			} else if _conCheck == vk_lalt {
				sprKeyInd = lAlt;
				keyText = "[L-ALT]";
			} else if _conCheck == vk_lcontrol {
				sprKeyInd = lCtrl;
				keyText = "[L-CTRL]";
			} else if _conCheck == vk_tab {
				sprKeyInd = tab;
				keyText = "[TAB]";
			} else
			
			
			if _conCheck == vk_f1 {
				sprKeyInd = fF1;
				keyText = "[F1]";
			} else if _conCheck == vk_f2 {
				sprKeyInd = fF2;
				keyText = "[F2]";
			} else if _conCheck == vk_f3 {
				sprKeyInd = fF3;
				keyText = "[F3]";
			} else if _conCheck == vk_f4 {
				sprKeyInd = fF4;
				keyText = "[F4]";
			} else if _conCheck == vk_f5 {
				sprKeyInd = fF5;
				keyText = "[F5]";
			} else if _conCheck == vk_f6 {
				sprKeyInd = fF6;
				keyText = "[F6]";
			} else if _conCheck == vk_f7 {
				sprKeyInd = fF7;
				keyText = "[F7]";
			} else if _conCheck == vk_f8 {
				sprKeyInd = fF8;
				keyText = "[F8]";
			} else if _conCheck == vk_f9 {
				sprKeyInd = fF9;
				keyText = "[F9]";
			} else if _conCheck == vk_f10 {
				sprKeyInd = fF10;
				keyText = "[F10]";
			} else if _conCheck == vk_f11 {
				sprKeyInd = fF11;
				keyText = "[F11]";
			} else if _conCheck == vk_f12 {
				sprKeyInd = fF12;
				keyText = "[F12]";
			} else
			
			
			if _conCheck == vk_escape {
				sprKeyInd = escape;
				keyText = "[ESC]";
			}
			
} else {
	_conCheck = global.Action2ButtonSpeed;
	
	if global.ConType == 0 {
		sprite = spr_XboxBinds;
	} else if global.ConType == 1 {
		sprite = spr_PSBinds;
	} else if global.ConType == 2 {
		sprite = spr_SwitchBinds;
	}
	
	image_index = sprConInd;
	
			if _conCheck == gp_stickl {
				sprConInd = lStickBut;
				
				if global.ConType == 0 {
					keyText = "[L-STICK]";
				} else if global.ConType == 1 {
					keyText = "[L3]";
				} else if global.ConType == 2 {
					keyText = "[L-STICK]";
				}
			} else if _conCheck == gp_stickr {
				sprConInd = rStickBut;
				
				if global.ConType == 0 {
					keyText = "[R-STICK]";
				} else if global.ConType == 1 {
					keyText = "[R3]";
				} else if global.ConType == 2 {
					keyText = "[R-STICK]";
				}
			}
			
			
			if _conCheck == gp_padl {
				sprConInd = padLeft;
				keyText = "[" + scr_LocalText("opt_ConLeft") + "]";
			} else if _conCheck == gp_padr {
				sprConInd = padRight;
				keyText = "[" + scr_LocalText("opt_ConRight") + "]";
			} else if _conCheck == gp_padu {
				sprConInd = padUp;
				keyText = "[" + scr_LocalText("opt_ConUp") + "]";
			} else if _conCheck == gp_padd {
				sprConInd = padDown;
				keyText = "[" + scr_LocalText("opt_ConDown") + "]";
			}
			
			
			if _conCheck == gp_face1 {
				sprConInd = face1;
				
				if global.ConType == 0 {
					keyText = "[A]";
				} else if global.ConType == 1 {
					keyText = "[X]";
				} else if global.ConType == 2 {
					keyText = "[B]";
				}
			} else if _conCheck == gp_face2 {
				sprConInd = face2;
				
				if global.ConType == 0 {
					keyText = "[B]";
				} else if global.ConType == 1 {
					keyText = "[" + scr_LocalText("opt_ConCircle") + "]";
				} else if global.ConType == 2 {
					keyText = "[A]";
				}
			} else if _conCheck == gp_face3 {
				sprConInd = face3;
				
				if global.ConType == 0 {
					keyText = "[X]";
				} else if global.ConType == 1 {
					keyText = "[" + scr_LocalText("opt_ConSquare") + "]";
				} else if global.ConType == 2 {
					keyText = "[Y]";
				}
			} else if _conCheck == gp_face4 {
				sprConInd = face4;
				
				if global.ConType == 0 {
					keyText = "[Y]";
				} else if global.ConType == 1 {
					keyText = "[" + scr_LocalText("scr_ConTriangle") + "]";
				} else if global.ConType == 2 {
					keyText = "[X]";
				}
			}
			
			
			if _conCheck == gp_shoulderl {
				sprConInd = shouldLB;
				
				if global.ConType == 0 {
					keyText = "[LB]";
				} else if global.ConType == 1 {
					keyText = "[L1]";
				} else if global.ConType == 2 {
					keyText = "[L]";
				}
			} else if _conCheck == gp_shoulderlb {
				sprConInd = shouldLT;
				
				if global.ConType == 0 {
					keyText = "[LT]";
				} else if global.ConType == 1 {
					keyText = "[L2]";
				} else if global.ConType == 2 {
					keyText = "[SL]";
				}
			} else if _conCheck == gp_shoulderr {
				sprConInd = shouldRB;
				
				if global.ConType == 0 {
					keyText = "[RB]";
				} else if global.ConType == 1 {
					keyText = "[R1]";
				} else if global.ConType == 2 {
					keyText = "[R]";
				}
			} else if _conCheck == gp_shoulderrb {
				sprConInd = shouldRT;
				
				if global.ConType == 0 {
					keyText = "[RT]";
				} else if global.ConType == 1 {
					keyText = "[R2]";
				} else if global.ConType == 2 {
					keyText = "[SR]";
				}
			}
			
			
			if _conCheck == gp_start {
				sprConInd = butStart;
				
				if global.ConType == 0 {
					keyText = "[" + scr_LocalText("opt_ConStart") + "]";
				} else if global.ConType == 1 {
					keyText = "[" + scr_LocalText("title_Options") +"]";
				} else if global.ConType == 2 {
					keyText = "[+]";
				}
			} else if _conCheck == gp_select {
				sprConInd = butSelect;
				
				if global.ConType == 0 {
					keyText = "[" + scr_LocalText("opt_ConSelect") + "]";
				} else if global.ConType == 1 {
					keyText = "[" + scr_LocalText("con_Touchpad") +"]";
				} else if global.ConType == 2 {
					keyText = "[-]";
				}
			}
}


sprite_index = sprite;
