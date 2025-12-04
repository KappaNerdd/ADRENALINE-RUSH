if instance_number(object_index) > 1 {
    instance_destroy();
}

//Keys Enum
enum eKey {
    LeftPressed,
    RightPressed,
    UpPressed,
    DownPressed,
	
    JumpPressed,
	JumpHeld,
	
	ActionPressed,
	ActionHeld,
	
	BoostPressed,
	BoostHeld,
	
	SwapPressed,
	
	Special1Pressed,
	Special1Held,
	
	Special2Pressed,
	Special2Held,



    LeftReleased,
    RightReleased,
    UpReleased,
    DownReleased,
	
	JumpReleased,
	JumpPReleased,
	
	ActionReleased,
	ActionPReleased,
	
	BoostReleased,
	BoostPReleased,
	
	SwapReleased,
	
	Special1Released,
	Special1PReleased,
	
	Special2Released,
	Special2PReleased,
	

    NUM_KEYS
}

//Variables
fileName = string(global.speedStageData[global.SpeedSelected].record_File) + "Replay.sav";

//Check if currently recording or playing
if !global.Replay {
	isRecording = true;
	isPlaying = false;
} else {
	isRecording = false;
	isPlaying = true;
}

confirmPlay = false;

// Variables to keep track of the frames
frame = 0;
index = 0;

//Arrays to store the keys to record, and the recorded values and frames
input = array_create(eKey.NUM_KEYS, false);
inputSequence = [0, 0];
