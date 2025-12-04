draw_self();

var _start = scr_LocalText("opt_Pause");

draw_text(x + 8, y + 4, string(_start));

draw_sprite(spr_OptionCheckbox, global.UniquePauseTheme, x - 32, y);