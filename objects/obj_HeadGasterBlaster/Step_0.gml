if !fire {
	if beepTimer > 0 {
		beepTimer--;
	} else {
		if waitTimer > 30 {
			beepTimer = 10;
		} else {
			beepTimer = 5;
		}
			
		obj_SFXManager.funkinFav = true;
	}
}

if image_xscale > image_yscale {
	hori = true;
} else if image_yscale > image_xscale {
	verti = true;
}

if image_alpha < 0.85 {
	canHurt = false;
} else {
	canHurt = true;
}

if waitTimer > 0 {
	waitTimer--;
	
	if !global.SimplifyVFX {
		if waitTimer < 30 {
			image_speed = 3;
		} else {
			image_speed = 1;
		}
	}
} else {
	if !fire {
		fire = true;
		obj_SFXManager.UNDERTALEBombSplosion = true;
		obj_SFXManager.UNDERTALERainbow = true;
		scr_ControllerRumble(0.5, 30);
		scr_ScreenShake(1, 30, hori, verti);
	}
}

if fire {
	if sustain > 0 {
		sustain--;
		image_alpha = scr_Approach(image_alpha, 1, 0.05);
		
		if hori && !verti {
			fakeXScale = image_xscale;
		
			if !back {
				if fakeYScale < image_yscale + 0.5 {
					fakeYScale = scr_Approach(fakeYScale, image_yscale + 0.5, 0.2);
				} else {
					back = true;
				}
			} else {
				if fakeYScale > image_yscale {
					fakeYScale = scr_Approach(fakeYScale, image_yscale, 0.2);
				} else {
					back = false;
				}
			}
		} else if !hori && verti {
			fakeYScale = image_yscale;
		
			if !back {
				if fakeXScale < image_xscale + 0.5 {
					fakeXScale = scr_Approach(fakeXScale, image_xscale + 0.5, 0.2);
				} else {
					back = true;
				}
			} else {
				if fakeXScale > image_xscale {
					fakeXScale = scr_Approach(fakeXScale, image_xscale, 0.2);
				} else {
					back = false;
				}
			}
		}
	} else {
		image_alpha = scr_Approach(image_alpha, 0, 0.05);
		
		if hori {
			fakeYScale = scr_Approach(fakeYScale, 0, 0.25);
		}
		
		if verti {
			fakeXScale = scr_Approach(fakeXScale, 0, 0.25);
		}
		
		if image_alpha <= 0 {
			instance_destroy();
		}
	}
}