draw_self();

var _start = scr_LocalText("opt_ScrShk");

draw_text(x + 8, y + 4, string(_start));

draw_sprite(spr_OptionCheckbox, global.ScreenShake, x - 32, y);