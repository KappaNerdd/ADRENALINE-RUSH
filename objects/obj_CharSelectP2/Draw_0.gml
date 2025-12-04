draw_self();

var _player = 0;

if gamepad_is_connected(global.Player2Con) {
	_player = spr_Player2;
} else {
	_player = spr_PlayerCPU;
}

draw_sprite_ext(_player, 3, x + 25, y - 25, 0.5, 0.5, 0, c_white, pAlpha);