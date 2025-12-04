depth = -10;

target_x = 0;
target_y = 0;
target_rm = 0;
target_xscale = 0;

trans = spr_RoomTransitionBasic;

if instance_exists(obj_Player) {
	obj_Player.can_Move = false;
}