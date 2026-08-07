var _treeX1 = lengthdir_x(1, -tree1Angle);
var _treeY1 = lengthdir_y(1, -tree1Angle);

var _treeX2 = lengthdir_x(2, tree2Angle);
var _treeY2 = lengthdir_y(2, tree2Angle);

draw_self();

draw_sprite_ext(sprite_index, 1, x + _treeX1, y + _treeY1, image_xscale, image_yscale, 0, c_white, 1);

draw_sprite_ext(sprite_index, 2, x + _treeX2, y + _treeY2, image_xscale, image_yscale, 0, c_white, 1);