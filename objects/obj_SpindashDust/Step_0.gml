with (obj_Player) {
	if spindash {
		if spindash && !spindashRev {
			other.sprite_index = spr_SpindashDust;
		} else if spindash && spindashRev {
			other.sprite_index = spr_SpindashDustRev;
		}
	} else if superPeelout {
		if superPeelout && up_Key {
			if superPeeloutTimer > superPeeloutMax / 2 {
				other.sprite_index = spr_SpindashDustRev;
			} else {
				other.sprite_index = spr_SpindashDust;
			}
		}
	}
	
	
	if spindash or superPeelout {
		other.image_xscale = image_xscale;
	}
	
	
	
	if (!superPeelout && !up_Key) && (!spindash && !spindashRev && !down_Key) {
		other.sprite_index = spr_SpindashDustGone;
	}
}