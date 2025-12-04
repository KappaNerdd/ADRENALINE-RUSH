draw_self();

var _start = scr_LocalText("opt_Default");

draw_text(x + 8, y + 4, string(_start));

draw_sprite_ext(obj_CustomAct4KeySpeed.sprite_index, obj_CustomAct4KeySpeed.image_index, x - 80, y + 16, 1, 1, 0, c_white, 1);