depth = obj_Player.depth + 1;

drawAngle = 0;
vel = 0;
yspd = 0;

//Change Partner

if global.PartnerChar == -1 {
	instance_destroy();
} else if global.PartnerChar == 2 {
	instance_change(obj_SarahOverworldPartner, true);
}