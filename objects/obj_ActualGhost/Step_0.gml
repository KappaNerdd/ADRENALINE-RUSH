if instance_exists(obj_StageTrackerSpeed) {
	if frame < ghostFrames {
		frameData = ghostData[| frame];
	
		x = frameData[? "x"];
		y = frameData[? "y"];
		image_xscale = frameData[? "xscale"];
		image_yscale = frameData[? "yscale"];
		sprite_index = frameData[? "sprite"];
		image_index = frameData[? "image"];
	
		frame++;
	}
}

visible = !visible;
