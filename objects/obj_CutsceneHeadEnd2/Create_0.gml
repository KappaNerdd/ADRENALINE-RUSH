//This shit looks organized, but trust me, I NEED a cutscene system for this to work infinitely better.
fixCameraTimer = 2;


createBeamTimer = 180;

waitBeamTimer = 120;
crouchTimer = 120;

preJumpTimer = 10;
jumpTimer = 15;
jumpingTimer = 30;


instance_create_depth(obj_Player.x - 300, obj_Player.y, depth, obj_HeadEndBeam);

visible = false;