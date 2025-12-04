draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, c_white, 1);
draw_sprite_ext(obj_CustomAct4KeySpeed.sprite_index, obj_CustomAct4KeySpeed.image_index, x, y + 32, 1, 1, 0, c_white, 1);

draw_sprite_ext(sprite_index, image_index, x - 352, y - 64, 11, 10, 0, c_white, 0.5);
draw_sprite_ext(spr_TextboxTrans, 0, x - 352, y - 64, 11, 10, 0, c_white, 1);

draw_text_transformed_color(x - 344, y + 8 - 64, "SPEED STAGES", 0.8, 1, 0, c_white, c_white, c_white, global.fullRGB, 1);
draw_text_transformed_color(x - 344, y + 8 - 64, "\n" + string(move1) + "\n" + string(move2) + "\n" + string(move3) + "\n" + string(move4) + "\n" + string(move5) + "\n" + string(move6), 0.7, 1, 0, c_white, c_white, c_white, c_white, 1);

