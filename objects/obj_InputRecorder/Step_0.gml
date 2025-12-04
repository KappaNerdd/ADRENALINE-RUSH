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
		scr_PlayInputRecording();	
	}
}

