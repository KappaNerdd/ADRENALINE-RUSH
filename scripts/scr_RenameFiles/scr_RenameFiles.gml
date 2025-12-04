function scr_RenameFiles() {
	#region //Main File
		if file_exists("TBAHSMAINDATA1.sav") {
			file_rename("TBAHSMAINDATA1.sav", global.MainDataFile + "1.sav");
		}

		if file_exists("TBAHSMAINDATA2.sav") {
			file_rename("TBAHSMAINDATA2.sav", global.MainDataFile + "2.sav");
		}

		if file_exists("TBAHSMAINDATA3.sav") {
			file_rename("TBAHSMAINDATA3.sav", global.MainDataFile + "3.sav");
		}

		if file_exists("TBAHSMAINDATA4.sav") {
			file_rename("TBAHSMAINDATA4.sav", global.MainDataFile + "4.sav");
		}

		if file_exists("TBAHSMAINDATA5.sav") {
			file_rename("TBAHSMAINDATA5.sav", global.MainDataFile + "5.sav");
		}

		if file_exists("TBAHSMAINDATA6.sav") {
			file_rename("TBAHSMAINDATA6.sav", global.MainDataFile + "6.sav");
		}

		if file_exists("TBAHSMAINDATA7.sav") {
			file_rename("TBAHSMAINDATA7.sav", global.MainDataFile + "7.sav");
		}
	#endregion

	#region //Speed Stage File
		if file_exists("TBAHSSPEEDDATA1.sav") {
			file_rename("TBAHSSPEEDDATA1.sav", global.SpeedDataFile + "1.sav");
		}
	
		if file_exists("TBAHSSPEEDDATA2.sav") {
			file_rename("TBAHSSPEEDDATA2.sav", global.SpeedDataFile + "2.sav");
		}
	
		if file_exists("TBAHSSPEEDDATA3.sav") {
			file_rename("TBAHSSPEEDDATA3.sav", global.SpeedDataFile + "3.sav");
		}
	
		if file_exists("TBAHSSPEEDDATA4.sav") {
			file_rename("TBAHSSPEEDDATA4.sav", global.SpeedDataFile + "4.sav");
		}
	
		if file_exists("TBAHSSPEEDDATA5.sav") {
			file_rename("TBAHSSPEEDDATA5.sav", global.SpeedDataFile + "5.sav");
		}
	
		if file_exists("TBAHSSPEEDDATA6.sav") {
			file_rename("TBAHSSPEEDDATA6.sav", global.SpeedDataFile + "6.sav");
		}
	
		if file_exists("TBAHSSPEEDDATA7.sav") {
			file_rename("TBAHSSPEEDDATA7.sav", global.SpeedDataFile + "7.sav");
		}
	#endregion

	#region //Action Stage File
		if file_exists("TBAHSACTIONDATA1.sav") {
			file_rename("TBAHSACTIONDATA1.sav", global.ActionDataFile + "1.sav");
		}
	
		if file_exists("TBAHSACTIONDATA2.sav") {
			file_rename("TBAHSACTIONDATA2.sav", global.ActionDataFile + "2.sav");
		}
	
		if file_exists("TBAHSACTIONDATA3.sav") {
			file_rename("TBAHSACTIONDATA3.sav", global.ActionDataFile + "3.sav");
		}
	
		if file_exists("TBAHSACTIONDATA4.sav") {
			file_rename("TBAHSACTIONDATA4.sav", global.ActionDataFile + "4.sav");
		}
	
		if file_exists("TBAHSACTIONDATA5.sav") {
			file_rename("TBAHSACTIONDATA5.sav", global.ActionDataFile + "5.sav");
		}
	
		if file_exists("TBAHSACTIONDATA6.sav") {
			file_rename("TBAHSACTIONDATA6.sav", global.ActionDataFile + "6.sav");
		}
	
		if file_exists("TBAHSACTIONDATA7.sav") {
			file_rename("TBAHSACTIONDATA7.sav", global.ActionDataFile + "7.sav");
		}
	#endregion

	#region //No Mind File
		if file_exists("TBAHSNOMINDDATA1.sav") {
			file_rename("TBAHSNOMINDDATA1.sav", global.NoMindDataFile + "1.sav");
		}
	
		if file_exists("TBAHSNOMINDDATA2.sav") {
			file_rename("TBAHSNOMINDDATA2.sav", global.NoMindDataFile + "2.sav");
		}
	
		if file_exists("TBAHSNOMINDDATA3.sav") {
			file_rename("TBAHSNOMINDDATA3.sav", global.NoMindDataFile + "3.sav");
		}
	
		if file_exists("TBAHSNOMINDDATA4.sav") {
			file_rename("TBAHSNOMINDDATA4.sav", global.NoMindDataFile + "4.sav");
		}
	
		if file_exists("TBAHSNOMINDDATA5.sav") {
			file_rename("TBAHSNOMINDDATA5.sav", global.NoMindDataFile + "5.sav");
		}
	
		if file_exists("TBAHSNOMINDDATA6.sav") {
			file_rename("TBAHSNOMINDDATA6.sav", global.NoMindDataFile + "6.sav");
		}
	
		if file_exists("TBAHSNOMINDDATA7.sav") {
			file_rename("TBAHSNOMINDDATA7.sav", global.NoMindDataFile + "7.sav");
		}
	#endregion

	#region //Past Mind File
		if file_exists("TBAHSPASTMINDDATA.sav") {
			file_rename("TBAHSPASTMINDDATA.sav", global.PastMindDataFile + ".sav");
		}
	#endregion

	#region //Options File
		if file_exists("TBAHSOPTIONSDATA.sav") {
			file_rename("TBAHSOPTIONSDATA.sav", global.OptionsDataFile + ".sav");
		}
	#endregion

	#region //Options File
		if file_exists("TBAHSCONTROLSDATA.sav") {
			file_rename("TBAHSCONTROLSDATA.sav", global.ControlsDataFile + ".sav");
		}
	#endregion
}


