function scr_WriteInputRecording() {
	//WriteInputRecording Script
	var _file = file_text_open_write(argument0);

	for (var i = 0; i < array_length(inputSequence); i++) {
	    file_text_write_real(_file, inputSequence[i, 0]);
	    file_text_write_real(_file, inputSequence[i, 1]);
	    file_text_writeln(_file);
	}

	inputSequence = 0;

	file_text_close(_file);
}


function scr_ReadInputRecording() {
	//ReadInputRecording
	var _file = file_text_open_read(argument0);
	var i = 0;

	while !file_text_eof(_file) {
	    inputSequence[i, 0] = file_text_read_real(_file);
	    inputSequence[i, 1] = file_text_read_real(_file);
	    file_text_readln(_file);

	    i++;
	}

	file_text_close(_file);
}


function scr_PlayInputRecording() {
	//PlayInputRecording Script
	var _player = instance_find(obj_Player, 0);

	if _player != noone {
	    while index < array_length(inputSequence) && inputSequence[index, 0] == frame {
	        switch inputSequence[index, 1] {
	            case eKey.LeftPressed: _player.left_Key = true; break;
				case eKey.RightPressed: _player.right_Key = true; break;
				case eKey.UpPressed: _player.up_Key = true; break;
				case eKey.DownPressed: _player.down_Key = true; break;
				
				case eKey.LeftReleased: _player.left_Key = false; break;
				case eKey.RightReleased: _player.right_Key = false; break;
				case eKey.UpReleased: _player.up_Key = false; break;
				case eKey.DownReleased: _player.down_Key = false; break;
				
				case eKey.JumpPressed: _player.jump_Key = true; break;
				case eKey.JumpHeld: _player.jump_Key_Held = true; break;
				case eKey.JumpReleased: _player.jump_Key_Held = false; break;
				case eKey.JumpPReleased: _player.jump_Key = false; break;
				
				case eKey.ActionPressed: _player.action_Key = true; break;
				case eKey.ActionHeld: _player.action_Key_Held = true; break;
				case eKey.ActionReleased: _player.action_Key_Held = false; break;
				case eKey.ActionPReleased: _player.action_Key = false; break;
				
				case eKey.BoostPressed: _player.action1_Key = true; break;
				case eKey.BoostHeld: _player.action1_Key_Held = true; break;
				case eKey.BoostReleased: _player.action1_Key_Held = false; break;
				case eKey.BoostPReleased: _player.action1_Key = false; break;
				
				case eKey.SwapPressed: _player.action3_Key = true; break;
				
				case eKey.Special1Pressed: _player.action2_Key = true; break;
				case eKey.Special1Held: _player.action2_Key_Held = true; break;
				case eKey.Special1Released: _player.action2_Key_Held = false; break;
				case eKey.Special1PReleased: _player.action2_Key = false; break;
				
				case eKey.Special2Pressed: _player.action4_Key = true; break;
				case eKey.Special2Held: _player.action4_Key_Held = true; break;
				case eKey.Special2Released: _player.action4_Key_Held = false; break;
				case eKey.Special2PReleased: _player.action4_Key = false; break;
	        }

	        index++;
	    }

	    frame++;
	}
}
