getCharacterControls();

var _stringWidth = scr_LocalText(global.JukeboxPlaylist[normJukeChoice][1]);

if boomChoice == 1 {
	if chosenPlay {
		if !chosenBoom {
			if array_length(global.NewJukes) > 0 {
				_stringWidth = string(filename_name(global.NewJukes[playChoice]));
			} else {
				_stringWidth = scr_LocalText("juke_NoFolders");
			}
		} else {
			if array_length(global.CustomJukeboxPlaylist) > 0 {
				_stringWidth = string(filename_name(global.CustomJukeboxPlaylist[custJukeChoice]));
			} else {
				_stringWidth = scr_LocalText("juke_NoTracks");
			}
		}
	}
}

if !chosenPlay && !chosenBoom {
	if boomChoice == 0 {
		_stringWidth = scr_LocalText("freeplay_NormJuke");
	} else {
		_stringWidth = scr_LocalText("freeplay_CustJuke");
	}
}

if chosenBoom && boomChoice == 1 {
	if custJukeChoice > array_length(global.CustomJukeboxPlaylist) - 1 {
		custJukeChoice = array_length(global.CustomJukeboxPlaylist) - 1;
	}
}

if !ultrakilled {
	#region //Animations
		boxX = lerp(boxX, 192, 0.1);
		boxY = lerp(boxY, 200, 0.1);
		bgAlph = lerp(bgAlph, 0.5, 0.1);
		albumY = lerp(albumY, 0, 0.1);
		
		if rightArrow {
			rightFrames += 1 / 2;
			
			if rightFrames >= 5 {
				rightArrow = false;
				rightFrames = 0;
			}
		}
		
		if leftArrow {
			leftFrames += 1 / 2;
			
			if leftFrames >= 5 {
				leftArrow = false;
				leftFrames = 0;
			}
		}
		
		if upArrow {
			upFrames += 1 / 2;
			
			if upFrames >= 5 {
				upArrow = false;
				upFrames = 0;
			}
		}
		
		if downArrow {
			downFrames += 1 / 2;
			
			if downFrames >= 5 {
				downArrow = false;
				downFrames = 0;
			}
		}
		
		if moveTextTimer > 0 {
			moveTextTimer--;
		} else {
			if trackTimer > 0 {
				trackTimer--;
			} else {
				trackTimer = 10;
				
				if moveTextX > -(string_width(_stringWidth) + 50) {
					moveTextX -= 10; 
				} else {
					moveTextX = 120;
				}
			}
		}
		
		speakerScale = lerp(speakerScale, 4, 0.15);
		
		if obj_MusicManager.songAsset != noone {
			if boomChoice == 1 {
				if speakerTimer > 0 {
					if !global.SimplifyVFX {
						speakerTimer--;
					}
				} else {
					speakerTimer = ceil(random(10));
					speakerScale = random_range(4.1, 4.25);
				}
			} else {
				scr_BPMStep();
		
				if scr_GetMainBeat() < scr_GetBeatProg() {
					if !global.SimplifyVFX {
						speakerScale = 4.2;
					}
				}
			}
		}
	#endregion
	
	#region //Movement
		if left_Key or right_Key or up_Key or down_Key {
			moveTimer--;
		} else {
			moveTimer = 1;
		}
		
		if moveTimer <= 0 {
			moveTimer = moveFrames;
			
			if !chosenPlay && !chosenBoom {
				if up_Key {
					boomChoice = !boomChoice;
					moveTextX = 0;
					moveTextTimer = 60;
					obj_SFXManager.funkinFav = true;
					upArrow = true;
					upFrames = 0;
					boxY -= 10;
				}
				
				if down_Key {
					boomChoice = !boomChoice;
					moveTextX = 0;
					moveTextTimer = 60;
					obj_SFXManager.funkinFav = true;
					downArrow = true;
					downFrames = 0;
					boxY += 10;
				}
			}

			if boomChoice == 0 && chosenBoom {
				if left_Key {
					obj_SFXManager.funkinFav = true;
					leftArrow = true;
					leftFrames = 0;
					moveTextX = 0;
					moveTextTimer = 60;
						
					do {
						if normJukeChoice > 0 {
							if curSprite != global.JukeboxPlaylist[normJukeChoice - 1][2] {
								curSprite = global.JukeboxPlaylist[normJukeChoice - 1][2];
								albumY = -10;
							}
							
							normJukeChoice--;
						} else {
							if curSprite != global.JukeboxPlaylist[array_length(global.JukeboxPlaylist) - 1][2] {
								curSprite = global.JukeboxPlaylist[array_length(global.JukeboxPlaylist) - 1][2];
								albumY = -10;
							}
							
							normJukeChoice = array_length(global.JukeboxPlaylist) - 1;
						}
					} until !global.JukeboxPlaylist[normJukeChoice][3];
				}
				
				if right_Key {
					obj_SFXManager.funkinFav = true;
					rightArrow = true;
					rightFrames = 0;
					moveTextX = 0;
					moveTextTimer = 60;
					
					do {
						if normJukeChoice < array_length(global.JukeboxPlaylist) - 1 {
							if curSprite != global.JukeboxPlaylist[normJukeChoice + 1][2] {
								curSprite = global.JukeboxPlaylist[normJukeChoice + 1][2];
								albumY = 10;
							}
						
							normJukeChoice++;
						} else {
							if curSprite != global.JukeboxPlaylist[0][2] {
								curSprite = global.JukeboxPlaylist[0][2];
								albumY = 10;
							}
						
							normJukeChoice = 0;
						}
					} until !global.JukeboxPlaylist[normJukeChoice][3];
				}
			} else if boomChoice == 1 {
				if !chosenBoom && chosenPlay {
					if right_Key {
						obj_SFXManager.homingLockOn = true;
						rightArrow = true;
						rightFrames = 0;
						moveTextX = 0;
						moveTextTimer = 60;
						boxX += 10;
						
						if playChoice < array_length(global.NewJukes) - 1 {
							playChoice++;
						} else {
							playChoice = 0;
						}
					}
						
					if left_Key {
						obj_SFXManager.homingLockOn = true;
						leftArrow = true;
						leftFrames = 0;
						moveTextX = 0;
						moveTextTimer = 60;
						boxX -= 10;
							
						if playChoice > 0 {
							playChoice--;
						} else {
							playChoice = array_length(global.NewJukes) - 1;
						}
					}
				} else if chosenBoom {
					if array_length(global.NewJukes) > 0 && array_length(global.CustomJukeboxPlaylist) > 0 {
						if right_Key {
							obj_SFXManager.funkinFav = true;
							rightArrow = true;
							rightFrames = 0;
							moveTextX = 0;
							moveTextTimer = 60;
							
							if custJukeChoice < array_length(global.CustomJukeboxPlaylist) - 1 {
								custJukeChoice++;
							} else {
								custJukeChoice = 0;
							}
						}
						
						if left_Key {
							obj_SFXManager.funkinFav = true;
							leftArrow = true;
							leftFrames = 0;
							moveTextX = 0;
							moveTextTimer = 60;
							
							if custJukeChoice > 0 {
								custJukeChoice--;
							} else {
								custJukeChoice = array_length(global.CustomJukeboxPlaylist) - 1;
							}
						}
					}
				}
			}
		}
	#endregion
	
	#region //Selection
		if jump_Key or pause_Key {
			if boomChoice == 0 {
				if !chosenBoom {
					chosenBoom = true;
					moveTextX = 0;
					moveTextTimer = 60;
					obj_SFXManager.menuPop = true;
				} else {
					if !audio_is_playing(global.JukeboxPlaylist[normJukeChoice][0]) {
						set_song_ingame(global.JukeboxPlaylist[normJukeChoice][0]);
						global.NormTrack = global.JukeboxPlaylist[normJukeChoice][0];
						scr_BPMCreate(global.JukeboxPlaylist[normJukeChoice][4], 60);
					} else {
						set_song_ingame(noone);
					}
					
					global.JukeBoxChoice = normJukeChoice;
				}
			} else if boomChoice == 1 {
				if !chosenPlay {
					chosenPlay = true;
					moveTextX = 0;
					moveTextTimer = 60;
					obj_SFXManager.menuPop = true;
					scr_LoadCustomMusic();
				} else {
					if array_length(global.NewJukes) > 0 {
						if !chosenBoom {
							chosenBoom = true;
							obj_SFXManager.menuPop = true;
							moveTextX = 0;
							moveTextTimer = 60;
							global.CustomJukeChoice = 0;
							custJukeChoice = 0;
							
							var _musPath = working_directory + "custom_boombox" + "/" + string(filename_name(global.NewJukes[playChoice]));
							var _musDir = file_find_first(string(global.NewJukes[playChoice]) + "/*", fa_directory);
							
							if array_length(global.CustomJukeboxPlaylist) > 0 {
								array_delete(global.CustomJukeboxPlaylist, 0, array_length(global.CustomJukeboxPlaylist));
							}
							
							if file_exists(_musPath + "/" + "album.png") {
								custAlbum = sprite_add(_musPath + "/" + "album.png", 0, false, false, 384, 384);
							} else {
								custAlbum = spr_AlbumPlaceholder;
							}
								
							while (_musDir != "") {
								if string_ends_with(_musDir, ".ogg") {
									array_push(global.CustomJukeboxPlaylist, _musPath + "/" + _musDir);
								}
								
							   _musDir = file_find_next();
							}
					
							file_find_close();
						} else {
							if array_length(global.CustomJukeboxPlaylist) > 0 {
								var _track = audio_create_stream(global.CustomJukeboxPlaylist[custJukeChoice]);
							
								if custNum != (playChoice * 10) + custJukeChoice {
									set_song_ingame(_track);
									global.CustTrack = _track;
									custNum = (playChoice * 10) + custJukeChoice;
									scr_BPMCreate(165);
								} else {
									set_song_ingame(noone);
									custNum = -1;
								}
							
								global.CustomJukeChoice = custJukeChoice;
							}
						}
					} else {
						obj_SFXManager.menuCancel = true;
					}
				}
			}
		}
	#endregion
	
	#region //Reload
		if action1_Key {
			if boomChoice == 1 {
				if !chosenBoom {
					obj_SFXManager.rushModeTrick = true;
					scr_LoadCustomMusic();
				}
			}
		}
	#endregion
	
	#region //Open Custom Music Folder
		if boomChoice == 1 && chosenPlay {
			if action3_Key {
				obj_SFXManager.clench = true;
				scr_OpenWorkDir("custom_boombox");
			}
		}
	#endregion
	
	#region //Cancel
		if action_Key {
			if chosenBoom {
				obj_SFXManager.UNDERTALEBombFly = true;
				chosenBoom = false;
			} else {
				if !chosenPlay {
					ultrakilled = true;
				} else {
					chosenPlay = false;
				}
				
				obj_SFXManager.UNDERTALEBombFly = true;
			}
		}
	#endregion
} else {
	boxY = lerp(boxY, -170, 0.15);
	bgAlph = lerp(bgAlph, 0, 0.15);
	
	if boxY <= -169.5 {
		instance_destroy();
		
		if obj_MusicManager.songAsset == noone {
			if room == rm_MainMenuNew {
				var _track = mus_WrapItUpK;
				
				if obj_MainMenu.nerd == 1 {
					_track = mus_WrapItUpL;
				}
				
				set_song_ingame(_track, 60, 0);
				scr_BPMCreate(165);
			}
			
			if room == rm_FreeplayNew {
				set_song_ingame(global.PlayerSelection[global.PlayerChar][20], 60);
				scr_BPMCreate(160);
			}
		}
	}
}