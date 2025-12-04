x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

visible = false;

depth = -130000000;

if global.PlayerChar != 0 && !global.MIND {
	scr_GetCharTextboxes();
} else {
	sprite_index = spr_TextboxHead;
}


global.CurOpt = "Main";


boxX = camera_get_view_x(view_camera[0]) - 230;
boxY = camera_get_view_y(view_camera[0]) + 30;

changeXSpeed = 5;


//Create Shit
if !instance_exists(obj_StageTrackerSpeed) {
	with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuResume)) {
		xspd = other.changeXSpeed;
	}
	
	with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuOptions)) {
		xspd = other.changeXSpeed;
	}
	
	with(instance_create_depth(boxX, boxY + 68, depth, obj_PauseMenuFileSelect)) {
		xspd = other.changeXSpeed;
	}
	
	with(instance_create_depth(boxX, boxY + 102, depth, obj_PauseMenuMainMenu)) {
		xspd = other.changeXSpeed;
	}
	
	with(instance_create_depth(boxX, boxY + 136, depth, obj_PauseMenuQuitGame)) {
		xspd = other.changeXSpeed;
	}
} else {
	if !global.Freeplay {
		if global.LevelForced {
			
			with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuResume)) {
				xspd = other.changeXSpeed;
			}
			
			with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuRestart)) {
				xspd = other.changeXSpeed;
			}
	
			with(instance_create_depth(boxX, boxY + 68, depth, obj_PauseMenuOptions)) {
				xspd = other.changeXSpeed;
			}
			
			with(instance_create_depth(boxX, boxY + 102, depth, obj_PauseMenuFileSelect)) {
				xspd = other.changeXSpeed;
			}
			
			with(instance_create_depth(boxX, boxY + 136, depth, obj_PauseMenuMainMenu)) {
				xspd = other.changeXSpeed;
			}
	
			with(instance_create_depth(boxX, boxY + 170, depth, obj_PauseMenuQuitGame)) {
				xspd = other.changeXSpeed;
			}
		} else {
			with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuResume)) {
				xspd = other.changeXSpeed;
			}
			
			with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuRestart)) {
				xspd = other.changeXSpeed;
			}
			
			with(instance_create_depth(boxX, boxY + 68, depth, obj_PauseMenuHUB)) {
				xspd = other.changeXSpeed;
			}
	
			with(instance_create_depth(boxX, boxY + 102, depth, obj_PauseMenuOptions)) {
				xspd = other.changeXSpeed;
			}
	
			with(instance_create_depth(boxX, boxY + 136, depth, obj_PauseMenuFileSelect)) {
				xspd = other.changeXSpeed;
			}
			
			with(instance_create_depth(boxX, boxY + 170, depth, obj_PauseMenuMainMenu)) {
				xspd = other.changeXSpeed;
			}
	
			with(instance_create_depth(boxX, boxY + 204, depth, obj_PauseMenuQuitGame)) {
				xspd = other.changeXSpeed;
			}
		}
	} else {
		with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuResume)) {
			xspd = other.changeXSpeed;
		}
			
		with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuRestart)) {
			xspd = other.changeXSpeed;
		}
			
		with(instance_create_depth(boxX, boxY + 68, depth, obj_PauseMenuFreeplay)) {
			xspd = other.changeXSpeed;
		}
	
		with(instance_create_depth(boxX, boxY + 102, depth, obj_PauseMenuOptions)) {
			xspd = other.changeXSpeed;
		}
	
		with(instance_create_depth(boxX, boxY + 136, depth, obj_PauseMenuFileSelect)) {
			xspd = other.changeXSpeed;
		}
		
		with(instance_create_depth(boxX, boxY + 170, depth, obj_PauseMenuMainMenu)) {
			xspd = other.changeXSpeed;
		}
	
		with(instance_create_depth(boxX, boxY + 204, depth, obj_PauseMenuQuitGame)) {
			xspd = other.changeXSpeed;
		}
	}
}


//Create Options
with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuYes)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuNo)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX - 70, boxY + 244, depth, obj_PauseMenuDefault)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX - 70, boxY + 278, depth, obj_PauseMenuBack)) {
	xspd = other.changeXSpeed;
}


with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuAudio)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuVisual)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 68, depth, obj_PauseMenuMisc)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 102, depth, obj_PauseMenuConSpd1)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 136, depth, obj_PauseMenuConSpd2)) {
	xspd = other.changeXSpeed;
}



//Audio
with(instance_create_depth(boxX - 70, boxY, depth, obj_PauseMenuAMaster)) {
	xspd = other.changeXSpeed;
}
			
with(instance_create_depth(boxX - 70, boxY + 34, depth, obj_PauseMenuAMusic)) {
	xspd = other.changeXSpeed;
}
			
with(instance_create_depth(boxX - 70, boxY + 68, depth, obj_PauseMenuASFX)) {
	xspd = other.changeXSpeed;
}
	
with(instance_create_depth(boxX - 70, boxY + 102, depth, obj_PauseMenuAText)) {
	xspd = other.changeXSpeed;
}
	
with(instance_create_depth(boxX - 70, boxY + 136, depth, obj_PauseMenuAAmbience)) {
	xspd = other.changeXSpeed;
}
	
with(instance_create_depth(boxX - 70, boxY + 170, depth, obj_PauseMenuAPauseTheme)) {
	xspd = other.changeXSpeed;
}


//Visual
with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuVSimplifyVFX)) {
	xspd = other.changeXSpeed;
}
			
with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuVParticles)) {
	xspd = other.changeXSpeed;
}
			
with(instance_create_depth(boxX, boxY + 68, depth, obj_PauseMenuVScreenShake)) {
	xspd = other.changeXSpeed;
}
	
with(instance_create_depth(boxX, boxY + 102, depth, obj_PauseMenuVLanguage)) {
	xspd = other.changeXSpeed;
}



//Misc
with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuMFullscreen)) {
	xspd = other.changeXSpeed;
}
			
with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuMConRum)) {
	xspd = other.changeXSpeed;
}
			
with(instance_create_depth(boxX, boxY + 68, depth, obj_PauseMenuMConType)) {
	xspd = other.changeXSpeed;
}
	
with(instance_create_depth(boxX, boxY + 102, depth, obj_PauseMenuMExtCamera)) {
	xspd = other.changeXSpeed;
}
	
with(instance_create_depth(boxX, boxY + 136, depth, obj_PauseMenuMSongTag)) {
	xspd = other.changeXSpeed;
}
	
with(instance_create_depth(boxX, boxY + 170, depth, obj_PauseMenuMFPS)) {
	xspd = other.changeXSpeed;
}



//Controls (Speed 1)
with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuCS1Left)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuCS1Right)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 68, depth, obj_PauseMenuCS1Up)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 102, depth, obj_PauseMenuCS1Down)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 136, depth, obj_PauseMenuCS1Jump)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 170, depth, obj_PauseMenuCS1Act1)) {
	xspd = other.changeXSpeed;
}



//Controls (Speed 2)
with(instance_create_depth(boxX, boxY, depth, obj_PauseMenuCS2Act2)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 34, depth, obj_PauseMenuCS2Act3)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 68, depth, obj_PauseMenuCS2Act4)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 102, depth, obj_PauseMenuCS2Act5)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 136, depth, obj_PauseMenuCS2Pause)) {
	xspd = other.changeXSpeed;
}

with(instance_create_depth(boxX, boxY + 170, depth, obj_PauseMenuCS2Select)) {
	xspd = other.changeXSpeed;
}


