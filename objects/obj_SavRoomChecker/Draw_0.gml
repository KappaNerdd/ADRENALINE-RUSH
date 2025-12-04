scr_RoomCheckerDraw();

savedRoom = global.statData[0].save_rm;

//Draw room name as Text
draw_text(obj_SavBox.x + 20, obj_SavBox.y + 60, string(_rmName));