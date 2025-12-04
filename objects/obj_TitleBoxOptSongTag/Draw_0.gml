draw_self();

var _start = scr_LocalText("opt_MusTag");

draw_text(x + 8, y + 4, string(_start));

draw_sprite(spr_OptionCheckbox, global.SongTag, x - 32, y);