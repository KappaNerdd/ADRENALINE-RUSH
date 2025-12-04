function scr_CollisionMain() {
	mask = argument0;

	if collision_circle(x, y, mask, obj_Solid, true, true) return true;
	return false;
}