instance_deactivate_all(true);

instance_activate_object(obj_PROTOTYPEMessage);
instance_activate_object(obj_Debug);
instance_activate_object(obj_Settings);
instance_activate_object(obj_GlobalControls);
instance_activate_object(obj_MusicManager);
instance_activate_object(obj_SFXManager);
instance_activate_object(obj_AmbienceManager);
instance_activate_object(obj_ConRumbleSystem);
instance_activate_object(obj_SaveNLoad);
instance_activate_object(obj_FullScreen);
instance_activate_object(obj_RoomTransParent);
instance_activate_object(obj_ParaBGParent);
instance_activate_object(obj_Solid);
instance_activate_object(obj_StageTrackerSpeed);
instance_activate_object(obj_NekoPresenceDemo);
instance_activate_object(obj_ControllerSystem);

if !audio_is_paused(obj_MusicManager.targetSongAsset) {
	audio_pause_sound(obj_MusicManager.targetSongAsset)
}

image_alpha = 0;