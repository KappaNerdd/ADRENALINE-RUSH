function scr_CollisionBottom() {
	mask = argument0;

	if collision_circle(x + asin * mask, y + acos * mask, 3, obj_Solid, true, true) return true;
	return false;
}

function scr_CollisionGround() {
	mask = argument0;

	if collision_circle(x + asin * (mask * 1.5), y + acos * (mask * 1.5), 3, obj_Solid, true, true) return true;
	return false;
}

function scr_CollisionLeft() {
	mask = argument0;

	if collision_circle(x - (acos * mask) - asin * 2, y + (asin * mask) - acos * 2, 3, obj_Solid, true, true) return true;
	return false;
}