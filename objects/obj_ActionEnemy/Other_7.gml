//Go to freeState
if state == "punchState1" or state == "punchState2" or state == "punchState3" or state == "5HState" or state == "2HState" {
	state = "freeState";
}


//Go to jumpState
if state == "J5HState" or state == "J2HState" or state == "J5LState" or state == "J5LLState" {
	state = "jumpState";
}