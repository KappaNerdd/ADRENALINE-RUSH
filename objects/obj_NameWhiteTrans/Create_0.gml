depth = -999999;

image_alpha = 0.001;

nextRoom = false;

set_song_ingame(noone, 8 * 60, 0);

if instance_exists(obj_TitleCursor) {
	instance_destroy(obj_TitleCursor);
}