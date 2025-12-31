
/// @description Update NekoPresence so async events will execute.

if global.DiscordRich {
	np_update();

	
	//Update some extra bullshit ("I'M ABOUT TO BEAT SOME ASSETS IN THIS KITCHEN!")

	///-----State-----///

	//Game & Character
	if global.PlayerChar == 0 {
		charIcon = "stagecharkappahead";
	} else if global.PlayerChar == 1 {
		if global.PlayerCostume == 0 {
			charIcon = "stagecharkappanormal";
		} else if global.PlayerCostume == 1 {
			charIcon = "stagecharkappahideki";
		}
	} else if global.PlayerChar == 2 {
		charIcon = "stagecharsarahnormal";
	} else if global.PlayerChar == 10 {
		charIcon = "stagecharrushnormal";
	} else if global.PlayerChar == 12 {
		charIcon = "stagecharivynormal";
	} else {
		charIcon = "stagecharkappahead";
	}


	//np_setpresence() should ALWAYS come the last!!
	np_setpresence("", "", "astraicon", string(charIcon));
}