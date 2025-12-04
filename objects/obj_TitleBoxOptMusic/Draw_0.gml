draw_self();

var _start = scr_LocalText("opt_Music");

draw_text(x + 8, y + 4, string(_start));

draw_sprite(spr_AudioSlider, global.MUSIC_VOL * 10, x - 105, y);