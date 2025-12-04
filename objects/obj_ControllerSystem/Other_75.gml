var _gamepad = async_load[? "pad_index"];

switch (async_load[? "event_type"]) {
	case "gamepad discovered":
		array_push(global.Controllers, _gamepad);
	break;
	
	case "gamepad lost":
		var _array_index = array_get_index(global.Controllers, _gamepad);
		
		if _array_index >= 0 {
			array_delete(global.Controllers, _array_index, 1);
		}
	break;
}


if !global.KeyboardP1 {
	if array_length(global.Controllers) > 0 {
		global.Player1Con = global.Controllers[0];
	
		p1Timer = 180;
		textAlphaP1 = 1;
		p2Timer = 180;
		textAlphaP2 = 1;
		p3Timer = 180;
		textAlphaP3 = 1;
	} else {
		global.Player1Con = 13;
	
		p1Timer = 180;
		textAlphaP1 = 1;
	}
} else {
	if array_length(global.Controllers) > 0 {
		global.Player2Con = global.Controllers[0];
	
		p1Timer = 180;
		textAlphaP1 = 1;
		p2Timer = 180;
		textAlphaP2 = 1;
		p3Timer = 180;
		textAlphaP3 = 1;
	} else {
		global.Player1Con = 13;
	
		p1Timer = 180;
		textAlphaP1 = 1;
	}
}

if !global.KeyboardP1 {
	if array_length(global.Controllers) > 1 {
		global.Player2Con = global.Controllers[1];

		p2Timer = 180;
		textAlphaP2 = 1;
	} else {
		global.Player2Con = 13;

		p2Timer = 180;
		textAlphaP2 = 1;
	}
} else {
	if array_length(global.Controllers) > 1 {
		global.Player3Con = global.Controllers[1];

		p3Timer = 180;
		textAlphaP3 = 1;
	} else {
		global.Player3Con = 13;

		p3Timer = 180;
		textAlphaP3 = 1;
	}
}


if !global.KeyboardP1 {
	if array_length(global.Controllers) > 2 {
		global.Player3Con = global.Controllers[2];

		p3Timer = 180;
		textAlphaP3 = 1;
	} else {
		global.Player3Con = 13;

		p3Timer = 180;
		textAlphaP3 = 1;
	}
}