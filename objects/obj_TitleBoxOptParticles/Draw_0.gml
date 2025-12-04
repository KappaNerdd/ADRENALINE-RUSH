draw_self();

var _start = scr_LocalText("opt_Part");

draw_text(x + 8, y + 4, string(_start));

draw_sprite(spr_OptionCheckbox, global.Particles, x - 32, y);