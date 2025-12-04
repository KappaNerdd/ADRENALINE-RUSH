var _xOff = 80;
var _yOff = 32;
var _spacing = scrollSpeed;

if global.modsLoader != 0 {
	for (var i = 0; i < array_length(global.modsLoader); i++) {
	    var _mod = global.modsLoader[i];
    
	    var _drawY = _yOff + (i * _spacing) - scrollOffset;
    
		if (_drawY + 64 > 0 && _drawY < room_height) {
			var _enabled = false;
			
	        for (var j = 0; j < array_length(global.activeMods); j++) {
	            if global.activeMods[j] == _mod {
	                _enabled = true;
	                break;
	            }
	        }
			
			//Mod Box
			var _hoveredCol = c_white;
			var _showModCredits = false;
			
			if action1_Key_Held {
				_showModCredits = true;
			}
			
			if i == selectedIndex {
				_hoveredCol = c_blue;
			} else {
				_hoveredCol = c_white;
				_showModCredits = false;
			}
			
			draw_sprite_ext(spr_GenericTextbox, image_index / 6, _xOff, _drawY, 15, 3, 0, _hoveredCol, 1);
			
			//Mod Checkbox
			draw_sprite_ext(spr_OptionCheckbox, _enabled, _xOff + 300, _drawY + 64, 1, 1, 0, c_white, 1);
	
		    //Mod Name & Type
		    draw_text(_xOff + 70, _drawY + 20, _mod.modName + " || Type: " + _mod.modType);
	
			//Mod Description
			if !_showModCredits {
				draw_text(_xOff + 10, _drawY + 64, _mod.modDesc);
			} else {
				draw_text(_xOff + 10, _drawY + 64, "By: " + _mod.modCredits);
			}
    
		    //Mod Sprite
			if file_exists(_mod.modIconCheck) {
			    if (sprite_exists(_mod.modIcon)) {
			        draw_sprite(_mod.modIcon, image_index, _xOff + 10, _drawY + 10);
			    }
			} else {
				draw_sprite(spr_DefaultModIcon, 0, _xOff + 10, _drawY + 10);
			}
		}
	}
	
	draw_set_halign(fa_center);
	
		draw_text_transformed(640 / 2, 10, "MODS/ADDONS LIST", 2, 2, 0);
	
	draw_set_halign(fa_left);
} else {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
		draw_text_transformed(640 / 2, 360 / 2, "NO MODS FOUND", 2, 2, 0);
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}
