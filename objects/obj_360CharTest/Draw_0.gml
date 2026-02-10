draw_self();

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

draw_text(_camX, _camY, string(angle));
draw_text(_camX, _camY + 20, string(xSpeed));
draw_text(_camX, _camY + 40, string(ySpeed));
draw_text(_camX, _camY + 60, string(ground));
draw_text(_camX, _camY + 80, string(bottomCollision));
draw_text(_camX, _camY + 100, string(edgeCollision));

if (drawSensors)
    {
        // Draw main masks
        draw_sprite_ext(spr_SarahIdleMask, 0, floor(x), floor(y), image_xscale, image_yscale, 0, c_white, 0.8);

        // Draw sensor masks
        draw_sprite_ext(maskBig, 0, floor(x + angleSin * sensorBottomDistance), floor(y + angleCos * sensorBottomDistance), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskMid, 0, floor(x + angleSin * 22), floor(y + angleCos * 22 + sensorMidDistance), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskBig, 0, floor(x - angleSin * sensorTopDistance), floor(y - angleCos * sensorTopDistance), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskBig, 0, floor(x - angleCos * sensorLeftDistance), floor(y + angleSin * sensorLeftDistance), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskBig, 0, floor(x + angleCos * sensorRightDistance), floor(y - angleSin * sensorRightDistance), image_xscale, image_yscale, 0, c_white, 0.8);

        draw_line(floor(x - sensorCos * 8 + sensorSin * 8), floor(y + sensorSin * 8 + sensorCos * 8), floor(x - sensorCos * 8 + sensorSin * 36), floor(y + sensorSin * 8 + sensorCos * 36))
        draw_line(floor(x + sensorCos * 8 + sensorSin * 8), floor(y - sensorSin * 8 + sensorCos * 8), floor(x + sensorCos * 8 + sensorSin * 36), floor(y - sensorSin * 8 + sensorCos * 36))
		
		draw_sprite_ext(maskMain, 0, floor(x), floor(y) + sensorMainYDist, image_xscale, image_yscale, 0, c_white, 0.5);
    }