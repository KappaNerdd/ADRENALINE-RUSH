draw_self();

var _start = scr_LocalText("opt_ExtCam");

draw_text(x + 8, y + 4, string(_start));

draw_sprite(spr_OptionCheckbox, global.ExtendCamera, x - 32, y);