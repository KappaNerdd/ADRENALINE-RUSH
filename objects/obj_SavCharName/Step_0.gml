//KILL Yourself if this doesn't exist
if !instance_exists(obj_SavBox) {
	instance_destroy();
}

///-----Character Names-----///
var _charVar = global.PlayerSelection[global.PlayerChar][0][0];

if file_exists(string(global.MainDataFile) + string(global.saveFile) + ".sav") {
	charName = _charVar;
} else {
	charName = "EMPTY";
}
