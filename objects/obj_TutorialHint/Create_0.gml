checkCons = [
	global.ConS_L, 
	"OR", 
	global.ConS_R
]

moveHint = "move_Move";
descHint = noone;

if !obj_Player.leftFacer {
	charHint = obj_Player.sprRun;
} else {
	charHint = obj_Player.sprRunRight;
}