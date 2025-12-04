function randomize_string(_string) {
    var _length = string_length(_string);
    var _charList = [];
    

    for (var i = 1; i <= _length; i++) {
        array_push(_charList, string_char_at(_string, i));
    }
    

    for (var i = _length - 1; i > 0; i--) {
        var j = irandom(i);
        var temp = _charList[i];
		
        _charList[i] = _charList[j];
        _charList[j] = temp;
    }
    
    
    var _randomizedString = "";
	
    for (var i = 0; i < _length; i++) {
        _randomizedString += _charList[i];
    }
    
    return _randomizedString;
}