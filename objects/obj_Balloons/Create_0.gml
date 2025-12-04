homingAttackable = true;

giveScore = true;

singBalloons = [
	spr_BalloonRed,
	spr_BalloonBlue,
]
singLength = array_length(singBalloons);


clustBalloons = [
	spr_BalloonCluster1,
]
clustLength = array_length(clustBalloons);

popped = false;
poppedTimer = 180;

cluster = false;

rSprite1 = 0;
rSprite2 = 0;

if cluster {
	rSprite1 = irandom(clustLength - 1);
} else {
	rSprite2 = irandom(singLength - 1);
}