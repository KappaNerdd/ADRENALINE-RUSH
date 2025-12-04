/// @desc Create 'n' Delete Highscore Docs
getCharacterControls();

if action2_Key {
	var _doc = json_stringify({
		name: get_string("Name: ", ""),
		highscore: get_integer("Highscore: ", 0),
	});
	
	FirebaseFirestore_SDK(root).Set(_doc);
}

if action4_Key && data != -1 && array_length(data) > 0 {
	var _doc = FirebaseFirestore_SDK(root).Child(data[0].id);
	
	_doc.Delete();
}
