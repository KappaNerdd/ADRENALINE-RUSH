//Move in a circle
dir += rotSpd;

var _targetX = xstart + lengthdir_x(radius, dir);
var _targetY = ystart + lengthdir_y(radius, dir);

vel = _targetX - x;
yspd = _targetY - y;

x += vel;
y += yspd;