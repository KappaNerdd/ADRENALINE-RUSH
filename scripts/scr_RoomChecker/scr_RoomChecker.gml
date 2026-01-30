function scr_RoomCheckerCreate() {
	savedRoom = "";
	_rmName = "";
}

function scr_RoomCheckerDraw() {
	
	#region ///-----Mind-----///

		//rm_HeadOverworld2
		if savedRoom == "rm_HeadOverworld2" {
			_rmName = "MIND - GREAT TREE (Early)";
		} else

		//rm_HeadOverworld4
		if savedRoom == "rm_HeadOverworld4" {
			_rmName = "MIND - GREAT TREE (Mid 1)";
		} else

		//rm_HeadOverworld6
		if savedRoom == "rm_HeadOverworld6" {
			_rmName = "MIND - GREAT TREE (Mid 2)";
		} else

		//rm_HeadOverworld9
		if savedRoom == "rm_HeadOverworld9" {
			_rmName = "MIND - GREAT TREE (End)";
		} else
	
	#endregion
	
	//Nayfin - "I might fuck everybody up in this restaurant." - Baku
	if savedRoom == "EMPTY" {
		_rmName = "EMPTY";
	}



	///-----Debug-----///

	//Test Room
	if savedRoom == "rm_Test" {
		_rmName = "Mind - Test";
	}
}