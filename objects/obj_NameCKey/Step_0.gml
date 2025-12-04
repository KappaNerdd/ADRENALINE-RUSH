visible = obj_NameBack.visible;

getCharacterControls();


if (action1_Key) && global.NameConfirm == false && string_length(global.PlayerName) < 15 {
	global.PlayerName = global.PlayerName + " ";
	obj_SFXManager.menuPop = true;
}