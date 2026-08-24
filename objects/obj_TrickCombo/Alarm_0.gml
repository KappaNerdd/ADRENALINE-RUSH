if trickChar != noone {
	if instance_exists(trickChar) {
		if trickChar.getScore {
			giveScore = true;
		} else {
			giveScore = false;
		}
	}
}