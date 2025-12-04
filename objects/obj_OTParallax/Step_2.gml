var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

scrollX -= 1;

if global.Particles {
	instance_create_depth(random_range(_camX, _camX + 1000), random_range(_camY, _camY - 5), depth, obj_OTLeaves);
	
	if room == rm_HometownNSpeed1 {
		createLeaves -= 1;
		
		if createLeaves <= 0 {
			instance_create_depth(random_range(_camX, _camX + 600), random_range(_camY, _camY + 300), depth, obj_OTSpecs);
			createLeaves = 20;
		}
	}
}

var _newX = 30;
var _newY = 80;
var _scale = 1;

if room != rm_HometownNSpeed1 {
	_newX = 78;
	_newY = -100;
}

layer_x("Still_Sun", 590 + _newX + _camX);
layer_y("Still_Sun", _newY + _camY);



layer_x("Parallax_Clouds1", _camX + (scrollX * 0.95));
layer_y("Parallax_Clouds1", 200 + _camY * 0.825);

layer_x("Parallax_Clouds2", _camX + ((scrollX / 2) * 0.975));
layer_y("Parallax_Clouds2", 250 + _camY * 0.85);

layer_x("Parallax_Clouds3", _camX + ((scrollX / 4) * 0.97));
layer_y("Parallax_Clouds3", 300 + _camY * 0.875);



layer_x("Parallax_Mountains1", _camX * 0.96);
layer_y("Parallax_Mountains1", 1350 + _camY * 0.8);

layer_x("Parallax_Mountains2", 50 + _camX * 0.97);
layer_y("Parallax_Mountains2", 1080 + _camY * 0.825);

layer_x("Parallax_Mountains3", 200 + _camX * 0.98);
layer_y("Parallax_Mountains3", 850 + _camY * 0.85);

layer_x("Parallax_Mountains4", 400 + _camX * 0.99);
layer_y("Parallax_Mountains4", 700 + _camY * 0.875);



layer_x("Parallax_Trees1", _camX * 0.8);
layer_y("Parallax_Trees1", 4950 + _camY * 0.2);

layer_x("Parallax_Trees2", 50 + _camX * 0.85);
layer_y("Parallax_Trees2", 4610 + _camY * 0.25);

layer_x("Parallax_Trees3", 100 + _camX * 0.875);
layer_y("Parallax_Trees3", 4260 + _camY * 0.3);

layer_x("Parallax_Trees4", 200 + _camX * 0.9);
layer_y("Parallax_Trees4", 3920 + _camY * 0.35);


if room == rm_HometownNSpeed1 {
	layer_x("Parallax_Stars1", _camX * 0.99);
	layer_y("Parallax_Stars1", _camY * 0.999);
	
	layer_x("Parallax_Stars2", _camX * 0.9945);
	layer_y("Parallax_Stars2", 30 + _camY * 0.999);
	
	layer_x("Parallax_Stars3", _camX * 0.999);
	layer_y("Parallax_Stars3", 60 + _camY * 0.999);
	
	var _layID = layer_get_id("Parallax_Stars1");
	var _layID2 = layer_get_id("Parallax_Stars2");
	var _layID3 = layer_get_id("Parallax_Stars3");
	var _backID = layer_background_get_id(_layID);
	var _backID2 = layer_background_get_id(_layID2);
	var _backID3 = layer_background_get_id(_layID3);
	
	
	var _imSpd = 8;
	var _imAlpha = 1;
	
	if global.SimplifyVFX {
		_imSpd = 0;
		_imAlpha = 0.5;
	}
	
	_scale = 0.5;
	
	layer_background_speed(_backID, _imSpd);
	layer_background_alpha(_backID, _imAlpha);
	
	layer_background_speed(_backID2, -_imSpd);
	layer_background_alpha(_backID2, _imAlpha);
	layer_background_xscale(_backID2, 0.85);
	layer_background_yscale(_backID2, 0.85);
	
	layer_background_speed(_backID3, _imSpd / 2);
	layer_background_alpha(_backID3, _imAlpha);
	layer_background_xscale(_backID3, 0.7);
	layer_background_yscale(_backID3, 0.7);
}

var _layMoonID = layer_get_id("Still_Sun");
var _backMoonID = layer_background_get_id(_layMoonID);

layer_background_xscale(_backMoonID, _scale);
layer_background_yscale(_backMoonID, _scale);