depth = -10;
x = -1000000;

image_alpha = 1;

scr_GetCharLevelCardPort();

charScale = 5;
charX = -300;

if global.LevelForced {
	if instance_exists(obj_InputRecorder) {
		if global.Replay {
			obj_InputRecorder.isPlaying = true;
		} else {
			obj_InputRecorder.isRecording = true;
		}
	}
		
	if instance_exists(obj_GhostRecorder) {
		if !global.Replay {
			obj_GhostRecorder.ghostRecord = true;
		}
	}
		
	if !instance_exists(obj_ActualGhost) {
		if global.ShowGhost {
			instance_create_depth(x, y, depth, obj_ActualGhost);
		}
	}
}

ranks = [
	spr_RankFNew,
	spr_RankDNew,
	spr_RankCNew,
	spr_RankBNew,
	spr_RankANew,
	spr_RankSNew,
	spr_RankPNew,
	
	spr_RankFHead,
	spr_RankDHead,
	spr_RankCHead,
	spr_RankBHead,
	spr_RankAHead,
	spr_RankSHead,
	spr_RankPHead,
]

mainAlpha = 0;
otheralpha = 1;
spikeInX = 0;
spikeX = 0;

spikeAnim = 1;
spikeFrames = 0;

charBoxFrames = 0;

charNameX = 384;
charNameXRepeat = 768;

charBoxY = 380;

levelXscale = 0;
levelXMove = -300;
levelXMove2 = 0;

mindAnim = 1 / 12;
mindFrames = 0;

rankAnim = 1 / 4;
rankFrames = 0;

kysTimer = 180;
