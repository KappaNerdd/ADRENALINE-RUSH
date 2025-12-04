/*with(obj_CharSelectWhiteBall) {
	if !playerConfirmed {
		if other.moveX > other.x {
			other.moveX -= 15;
		}
		
		if other.moveY > other.y {
			other.moveY -= 15;
		}

		if other.moveXP2 < other.x + 350 {
			other.moveXP2 += 15;
		}
		
		if other.moveYP2 > other.y {
			other.moveYP2 -= 15;
		}
		
		if other.moveXP3 < other.x + 350 {
			other.moveXP3 += 15;
		}
		
		if other.moveYP3 > other.y {
			other.moveYP3 -= 15;
		}
	} else if playerConfirmed && !partnerConfirmed {
		if other.moveY < other.y + 300 {
			other.moveY += 15;
		}
		
		if other.moveXP2 > other.x {
			other.moveXP2 -= 15;
		}
		
		if other.moveYP2 > other.y {
			other.moveYP2 -= 15;
		}
		
		if other.moveXP3 < other.x + 350 {
			other.moveXP3 += 15;
		}
		
		if other.moveYP3 > other.y {
			other.moveYP3 -= 15;
		}
		
		
		if global.SelectedPlayer == global.PlayerChar && global.SelectedPlayer != global.LockedChar[global.SelectedPlayer] {
			other.colorP2 = c_grey;
		} else if global.SelectedPlayer != global.PlayerChar && global.SelectedPlayer != global.LockedChar[global.SelectedPlayer] {
			other.colorP2 = c_white;
		}
	} else if playerConfirmed && partnerConfirmed {
		if other.moveY < other.y + 300 {
			other.moveY += 15;
		}
		
		if other.moveYP2 < other.y + 300 {
			other.moveYP2 += 15;
		}
		
		if other.moveXP3 > other.x {
			other.moveXP3 -= 15;
		}
		
		if other.moveYP3 > other.y {
			other.moveYP3 -= 15;
		}
		
		
		if (global.SelectedPlayer == global.PlayerChar or global.SelectedPlayer == global.PartnerChar) && global.SelectedPlayer != global.LockedChar[global.SelectedPlayer] {
			other.colorP3 = c_grey;
		} else if (global.SelectedPlayer != global.PlayerChar && global.SelectedPlayer != global.PartnerChar) && global.SelectedPlayer != global.LockedChar[global.SelectedPlayer] {
			other.colorP3 = c_white;
		}
	}
}*/


with(obj_CharSelectWhiteBall) {
	if other.moveX > other.x {
		other.moveX -= 10;
	}
}


if waitTimer > 0 {
	waitTimer -= 1;
	
	if global.SelectedCostume > global.CostumeNum - 1 {
		global.SelectedCostume = global.CostumeNum - 1;
	}
}

if waitTimer <= 0 {
	if global.PlayerSelection[global.SelectedPlayer][2] or !global.PlayerSelection[global.SelectedPlayer][4][global.SelectedCostume] {
		image_blend = c_black;
		colorP2 = c_black;
		colorP3 = c_black;
	} else {
		image_blend = c_white;
	}
}

scr_GetCharLevelCardPort();
