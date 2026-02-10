function scr_CollisionLeftBull() {
	mask = argument0;

	if collision_circle(x - (acos * mask) - asin * 2, y + (asin * mask) - acos * 2, 3, obj_Solid, true, true) return true;
	return false;
}