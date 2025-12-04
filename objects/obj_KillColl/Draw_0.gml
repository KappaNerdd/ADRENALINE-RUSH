draw_self();

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

draw_text(_camX + 400, _camY, string(global.Death));
draw_text(_camX + 400, _camY + 20, string(global.DeathCountdown));
draw_text(_camX + 400, _camY + 40, string(global.GameOverCountdown));