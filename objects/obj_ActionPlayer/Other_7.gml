#region //Lights (Ground)
	if state == "2LState" or state == "5LState" or state == "5LLState" or state == "5LLLState" {
		state = "freeState";
	}
#endregion

#region //Lights (Air)
	if state == "J5LState" or state == "J5MState" or state == "J2HState" or state == "J5HState" {
		if jumpCount > 0 {
			state = "jumpState";
		} else {
			state = "dJumpState";
		}
	}
#endregion

#region	//Mediums (Ground)
	if state == "2MState" or state == "5MState" or state == "5MMState" or state == "5MMMState" {
		state = "freeState";
	}
#endregion

#region //Heavys (Ground)
	if state == "2HState" or state == "5HState" or state == "6HState" {
		state = "freeState";
	}
#endregion
