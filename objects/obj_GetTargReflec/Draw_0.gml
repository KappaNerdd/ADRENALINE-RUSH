if (instance_Capture != noone) {
	if (surface_exists(surface_Mirror) == false) {
		surface_Mirror = surface_create(capture_Width, capture_Height);
	}
	
	surface_copy_part(surface_Mirror, 0, 0, application_surface, instance_Capture.x, instance_Capture.y, capture_Width, capture_Height);
	
	draw_surface(surface_Mirror, x, y);
} else {
	draw_self();
}

//draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), string(capture_Width));
//draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 20, string(capture_Width));