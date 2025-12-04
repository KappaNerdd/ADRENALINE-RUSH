/*#region //Set Audio for rooms
	#region //MIND
		if room == rm_HeadOverworld1 or room == rm_HeadOverworld2 or room == rm_HeadOverworld3 or room == rm_HeadOverworld4 or room == rm_HeadOverworld5 or room == rm_HeadOverworld6 or room == rm_HeadOverworld7 or room == rm_HeadOverworld8 or room == rm_HeadOverworld9 or room == rm_HeadOverworld10 or room == rm_HeadSpeed1 or room == rm_HeadSpeed2 or room == rm_HeadSpeedBoss or room == rm_HeadSpeedBonus1 {
			if !audio_group_is_loaded(Audio_EnviroMIND) {
				audio_group_load(Audio_EnviroMIND);
			}
		} else {
			if audio_group_is_loaded(Audio_EnviroMIND) {
				audio_group_unload(Audio_EnviroMIND);
			}
		}
	#endregion

	#region //OTHERTOWN
		if room == rm_HometownDSpeed1 or room == rm_HometownDSpeed2 or room == rm_HometownNSpeed1 {
			if !audio_group_is_loaded(Audio_EnviroOTHERTOWN) {
				audio_group_load(Audio_EnviroOTHERTOWN);
			}
		} else {
			if audio_group_is_loaded(Audio_EnviroOTHERTOWN) {
				audio_group_unload(Audio_EnviroOTHERTOWN);
			}
		}
	#endregion
#endregion


#region //Set Audio for Characters
	
#endregion
