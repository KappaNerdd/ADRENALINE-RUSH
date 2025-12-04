/// @desc Create Listener

root = "highscores";
listener = FirebaseFirestore_SDK(root).Listener();

data = -1;

sort_score = function(_a, _b) {
	return _b.highscore - _a.highscore;
}