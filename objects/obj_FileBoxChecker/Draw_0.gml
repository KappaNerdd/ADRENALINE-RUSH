draw_self();

if instance_exists(obj_FileBoxYes) {
	if obj_FileBoxYes.confirmed == false {
		draw_text(x + 10, y + 10, "Are you sure you want \nto start a new game? \n(Your previous saves \nWILL get deleted.)");
	} else {
		draw_text(x + 50, y + 50, "File deleted! \nRestarting game...");
	}
}