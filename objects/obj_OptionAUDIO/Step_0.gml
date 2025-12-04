getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && global.OptionChoice != 0 && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	global.OptionChoice = 0;
	obj_SFXManager.menuTap = true;
}

//Audio Options
if global.OptionChoice == 0 {
	if !instance_exists(obj_OptionMASTER) {
		instance_create_depth(330, 60, -100, obj_OptionMASTER);
	}
	
	if !instance_exists(obj_OptionMUSIC) {
		instance_create_depth(310, 90, -100, obj_OptionMUSIC);
	}
	
	if !instance_exists(obj_OptionSFX) {
		instance_create_depth(310, 120, -100, obj_OptionSFX);
	}
	
	if !instance_exists(obj_OptionTEXT) {
		instance_create_depth(290, 150, -100, obj_OptionTEXT);
	}
	
	if !instance_exists(obj_OptionAMBIENCE) {
		instance_create_depth(270, 180, -100, obj_OptionAMBIENCE);
	}
	
	if !instance_exists(obj_OptionUNIQUEPAUSETHEME) {
		instance_create_depth(268, 210, -100, obj_OptionUNIQUEPAUSETHEME);
	}
} else {
	if instance_exists(obj_OptionMASTER) {
		instance_destroy(obj_OptionMASTER);
	}
	
	if instance_exists(obj_OptionMUSIC) {
		instance_destroy(obj_OptionMUSIC);
	}
	
	if instance_exists(obj_OptionSFX) {
		instance_destroy(obj_OptionSFX);
	}
	
	if instance_exists(obj_OptionTEXT) {
		instance_destroy(obj_OptionTEXT);
	}
	
	if instance_exists(obj_OptionAMBIENCE) {
		instance_destroy(obj_OptionAMBIENCE);
	}
	
	if instance_exists(obj_OptionUNIQUEPAUSETHEME) {
		instance_destroy(obj_OptionUNIQUEPAUSETHEME);
	}
}


//Visual Options
if global.OptionChoice == 1 {
	if !instance_exists(obj_OptionSIMPLIFYVFX) {
		instance_create_depth(330, 60, -100, obj_OptionSIMPLIFYVFX);
	}
	
	if !instance_exists(obj_OptionSCREENSHAKE) {
		instance_create_depth(315, 90, -100, obj_OptionSCREENSHAKE);
	}
	
	if !instance_exists(obj_OptionPARTICLES) {
		instance_create_depth(300, 120, -100, obj_OptionPARTICLES);
	}
	
	if !instance_exists(obj_OptionLANGUAGE) {
		instance_create_depth(285, 150, -100, obj_OptionLANGUAGE);
	}
} else {
	if instance_exists(obj_OptionSIMPLIFYVFX) {
		instance_destroy(obj_OptionSIMPLIFYVFX);
	}
	
	if instance_exists(obj_OptionSCREENSHAKE) {
		instance_destroy(obj_OptionSCREENSHAKE);
	}
	
	if instance_exists(obj_OptionPARTICLES) {
		instance_destroy(obj_OptionPARTICLES);
	}
	
	if instance_exists(obj_OptionLANGUAGE) {
		instance_destroy(obj_OptionLANGUAGE);
	}
}


//Misc Options
if global.OptionChoice == 2 {
	if !instance_exists(obj_OptionFULLSCREEN) {
		instance_create_depth(330, 60, -100, obj_OptionFULLSCREEN);
	}
	
	if !instance_exists(obj_OptionSONGTAG) {
		instance_create_depth(310, 90, -100, obj_OptionSONGTAG);
	}
	
	if !instance_exists(obj_OptionCONTYPE) {
		instance_create_depth(298, 120, -100, obj_OptionCONTYPE);
	}
	
	if !instance_exists(obj_OptionCONRUMBLE) {
		instance_create_depth(290, 150, -100, obj_OptionCONRUMBLE);
	}
	
	if !instance_exists(obj_OptionEXTENDCAMERA) {
		instance_create_depth(280, 180, -100, obj_OptionEXTENDCAMERA);
	}
	
	if !instance_exists(obj_OptionFPSON) {
		instance_create_depth(230, 210, -100, obj_OptionFPSON);
	}
} else {
	if instance_exists(obj_OptionFULLSCREEN) {
		instance_destroy(obj_OptionFULLSCREEN);
	}
	
	if instance_exists(obj_OptionSONGTAG) {
		instance_destroy(obj_OptionSONGTAG);
	}
	
	if instance_exists(obj_OptionCONTYPE) {
		instance_destroy(obj_OptionCONTYPE);
	}
	
	if instance_exists(obj_OptionCONRUMBLE) {
		instance_destroy(obj_OptionCONRUMBLE);
	}
	
	if instance_exists(obj_OptionEXTENDCAMERA) {
		instance_destroy(obj_OptionEXTENDCAMERA);
	}
	
	if instance_exists(obj_OptionFPSON) {
		instance_destroy(obj_OptionFPSON);
	}
}


if global.OptionChoice == 3 {
	if !instance_exists(obj_OptionCUSLEFTKEYSPEED) {
		instance_create_depth(340, 60, -100, obj_OptionCUSLEFTKEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSRIGHTKEYSPEED) {
		instance_create_depth(515, 60, -100, obj_OptionCUSRIGHTKEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSUPKEYSPEED) {
		instance_create_depth(320, 100, -100, obj_OptionCUSUPKEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSDOWNKEYSPEED) {
		instance_create_depth(495, 100, -100, obj_OptionCUSDOWNKEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSJUMPKEYSPEED) {
		instance_create_depth(300, 140, -100, obj_OptionCUSJUMPKEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSACT1KEYSPEED) {
		instance_create_depth(475, 140, -100, obj_OptionCUSACT1KEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSACT2KEYSPEED) {
		instance_create_depth(280, 180, -100, obj_OptionCUSACT2KEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSACT3KEYSPEED) {
		instance_create_depth(455, 180, -100, obj_OptionCUSACT3KEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSACT4KEYSPEED) {
		instance_create_depth(260, 220, -100, obj_OptionCUSACT4KEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSACT5KEYSPEED) {
		instance_create_depth(435, 220, -100, obj_OptionCUSACT5KEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSPAUSEKEYSPEED) {
		instance_create_depth(240, 260, -100, obj_OptionCUSPAUSEKEYSPEED);
	}
	
	if !instance_exists(obj_OptionCUSSELECTKEYSPEED) {
		instance_create_depth(415, 260, -100, obj_OptionCUSSELECTKEYSPEED);
	}
	
} else {
	if instance_exists(obj_OptionCUSLEFTKEYSPEED) {
		instance_destroy(obj_OptionCUSLEFTKEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSRIGHTKEYSPEED) {
		instance_destroy(obj_OptionCUSRIGHTKEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSUPKEYSPEED) {
		instance_destroy(obj_OptionCUSUPKEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSDOWNKEYSPEED) {
		instance_destroy(obj_OptionCUSDOWNKEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSJUMPKEYSPEED) {
		instance_destroy(obj_OptionCUSJUMPKEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSACT1KEYSPEED) {
		instance_destroy(obj_OptionCUSACT1KEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSACT2KEYSPEED) {
		instance_destroy(obj_OptionCUSACT2KEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSACT3KEYSPEED) {
		instance_destroy(obj_OptionCUSACT3KEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSACT4KEYSPEED) {
		instance_destroy(obj_OptionCUSACT4KEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSACT5KEYSPEED) {
		instance_destroy(obj_OptionCUSACT5KEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSPAUSEKEYSPEED) {
		instance_destroy(obj_OptionCUSPAUSEKEYSPEED);
	}
	
	if instance_exists(obj_OptionCUSSELECTKEYSPEED) {
		instance_destroy(obj_OptionCUSSELECTKEYSPEED);
	}
	
}