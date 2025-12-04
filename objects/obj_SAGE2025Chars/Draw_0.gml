draw_self();

draw_text_transformed(x + 125, y + 4, "CHARACTERS COMING SOON", 1.5, 1.5, 0);

if global.speedStageData[0].complete && global.speedStageData[1].complete && global.speedStageData[2].complete && global.speedStageData[3].complete && global.speedStageData[5].complete && global.speedStageData[8].complete {
	draw_sprite_ext(global.PlayerSelection[char][12][0], 0, x + 320, y - 20, 0.5, 0.5, 0, c_white, 1);
	
	draw_text(x + 15, y + 30, "Select someone to see their bio and play their Freeplay theme.");
} else {
	draw_text(x + 70, y + 30, "Complete all levels in the demo to see who they are!");
}


draw_sprite(obj_CustomAct1KeySpeed.sprite_index, obj_CustomAct1KeySpeed.image_index, x + 560, y + 300);
