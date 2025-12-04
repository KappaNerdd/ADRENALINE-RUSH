draw_self();

var _start = scr_LocalText("opt_ConType");

draw_text(x + 8, y + 4, string(_start));

draw_sprite(spr_ConsoleLogos, global.ConType, x - 32, y);