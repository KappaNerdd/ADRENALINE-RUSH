for(var index = 0; index < instance_number(obj_ReflectionWater); index++) {
	var inst = instance_find(obj_ReflectionWater, index);
	
	if(inst.name == reflect) {
		instance_Capture = inst;
		
		capture_Width = abs(inst.bbox_left - inst.bbox_right);
		capture_Height = abs(inst.bbox_bottom - inst.bbox_top);
		
		inst.visible = false;
	}
}