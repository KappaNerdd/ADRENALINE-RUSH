sprite_index = rankGraphic;

if rankChecker == 0 {
	rankGraphic = rankF;
} else if rankChecker == 1 {
	rankGraphic = rankD;
} else if rankChecker == 2 {
	rankGraphic = rankC;
} else if rankChecker == 3 {
	rankGraphic = rankB;
} else if rankChecker == 4 {
	rankGraphic = rankA;
} else if rankChecker == 5 {
	rankGraphic = rankS;
} else if rankChecker == 6 {
	rankGraphic = rankP;
}

if rankChecker2 == 0 {
	rankGraphic2 = rankF;
} else if rankChecker2 == 1 {
	rankGraphic2 = rankD;
} else if rankChecker2 == 2 {
	rankGraphic2 = rankC;
} else if rankChecker2 == 3 {
	rankGraphic2 = rankB;
} else if rankChecker2 == 4 {
	rankGraphic2 = rankA;
} else if rankChecker2 == 5 {
	rankGraphic2 = rankS;
} else if rankChecker2 == 6 {
	rankGraphic2 = rankP;
}



totalSeconds = (global.minutes * 100) + global.seconds;
var _speedStage = global.speedStageData[global.SpeedSelected];	
	
	
if totalSeconds <= _speedStage.rankS_Time {
	rankChecker = 5;
} else if totalSeconds <= _speedStage.rankA_Time {
	rankChecker = 4;
} else if totalSeconds <= _speedStage.rankB_Time {
	rankChecker = 3;
} else if totalSeconds <= _speedStage.rankC_Time {
	rankChecker = 2;
} else if totalSeconds <= _speedStage.rankD_Time {
	rankChecker = 1;
} else if totalSeconds <= _speedStage.rankF_Time {
	rankChecker = 0;
}


if global.GameScore >= _speedStage.rankS_Score {
	rankChecker2 = 5;
} else if global.GameScore >= _speedStage.rankA_Score && global.GameScore < _speedStage.rankS_Score {
	rankChecker2 = 4;
} else if global.GameScore >= _speedStage.rankB_Score && global.GameScore < _speedStage.rankA_Score {
	rankChecker2 = 3;
} else if global.GameScore >= _speedStage.rankC_Score && global.GameScore < _speedStage.rankB_Score {
	rankChecker2 = 2;
} else if global.GameScore >= _speedStage.rankD_Score && global.GameScore < _speedStage.rankC_Score {
	rankChecker2 = 1;
} else if global.GameScore < _speedStage.rankD_Score {
	rankChecker2 = 0;
}

var _totalRank = ((rankChecker + rankChecker2) / 2);

global.RankTime = rankChecker;
global.RankScore = rankChecker2;
global.Rank = round(_totalRank) + global.PRank;

if instance_exists(obj_LevelCard) or instance_exists(obj_LevelCardNew) or instance_exists(obj_ResultsCardNew) or instance_exists(obj_LevelCardMinor) or instance_exists(obj_ResultsCard) or instance_exists(obj_RoomTransParent) {
	moveY = lerp(moveY, -100, 0.1);
} else {
	moveY = lerp(moveY, 10, 0.1);
}