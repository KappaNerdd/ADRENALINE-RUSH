if !global.MIND && global.PlayerChar != 0 {
	if global.SimplifyVFX {
		image_speed = 0;
	} else {
		image_speed = 1;
	}
}

//Fill out array while the game is recording
if isRecording {
    //Iterate through each key and store the input and frame. Accepts multiple inputs at once.
    for (var i = 0; i < eKey.NUM_KEYS; i++) {
        if input[i] {
            inputSequence[index, 0] = frame;
            inputSequence[index, 1] = i;
            index++;
        }
    }

    frame++;
}

//Runs every frame to play the sequence when needed
if isPlaying {
	if !confirmPlay {
		scr_ReadInputRecording(fileName);
		confirmPlay = true;
	} else {
		
	}
	
	scr_PlayInputRecording();	
}

if global.Replay {
	visibleTimer--;
}

if visibleTimer <= 0 {
	visibleTimer = 30;
	
	visible = !visible;
}

