draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, c_white, 1);
draw_sprite_ext(obj_CustomAct2KeySpeed.sprite_index, obj_CustomAct2KeySpeed.image_index, x, y + 32, 1, 1, 0, c_white, 1);

draw_sprite_ext(sprite_index, image_index, x - 352, y, 11, 10, 0, c_white, 0.75);
draw_sprite_ext(spr_TextboxTrans, 0, x - 352, y, 11, 10, 0, c_white, 1);

draw_text_transformed_color(x - 344, y + 8, "SPEED STAGES", 0.8, 1, 0, c_white, c_white, c_white, global.fullRGB, 1);
draw_text_transformed_color(x - 344, y + 8, "\nNAME: " + string(charName) + "\nAGE: " + string(charAge) + "\nACCELERATION: " + "\nJUMP POWER: " + "\nWEIGHT: " + "\nMAX SPEED: " + "\nBREAK SPEED: ", 1, 1, 0, c_white, c_white, c_white, c_white, 1);


draw_sprite_ext(spr_CharSelectSpeedStat, charAcc, x - 190, y + 5 + (25 * 3), 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_CharSelectOtherStat, charJspd, x - 220, y + 4 + (25 * 4), 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_CharSelectOtherStat, charGrav, x - 265, y + 3 + (25 * 5), 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_CharSelectSpeedStat, charMaxSpeed, x - 230, y + 2 + (25 * 6), 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_CharSelectSpeedStat, charFullSpeed, x - 205, y + 1 + (25 * 7), 1, 1, 0, c_white, 1);
