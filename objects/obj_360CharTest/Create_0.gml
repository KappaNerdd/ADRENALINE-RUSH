
ground = false;
xSpeed = 0;
ySpeed = 0;
ground_speed = 0;

// Actions
state = noone;
stateTimer = 0;
canAttack = false;

// Jump
jumpStrength = -6.5;        // Jump strength
jumpAirTimer = 0;           // Amount of time the player can stay in air while jumping

// Skid
skidDeceleration = 0.3;

// Spindash
spindashStrength = 0;
spindashStrengthMax = 10;

// Roll
rollFriction = 0.05; // Passive friction while rolling
rollBrakeFriction = 0.07; // Friction when holding opposite direction while rolling
rollUphillFriction = 0.06; // Friction when rolling uphill
rollDownhillForce = 0.25; // Acceleration when rolling downhill

// Movement Flags
canMove = true;
canMoveX = true;
canMoveY = true;

// Horizontal speed (change physics in the player physics script)
xTopSpeed = 20;
xMaxSpeed = 20;
xAcceleration = 0.08;
xFriction = 0.08;
xSlopeFactor = 0.14;
xMinSpeedToFall = 4; // Minimum speed to fall when on a slope
xFrictionTemp = 0;
xDirection = 1;

// Vertical speed
noGravityTimer = 0; // This keeps the gravity from being applied for a certain amount of time
yGravity = 0.21;
yDefaultGravity = yGravity;
yDirection = 1;

// Terrain
terrainLayer = 0;
onPlatform = false;
pushingWall = false;

angle = 0;
angleHolder = 0;
angleCos = 0;
angleSin = 0;
angleMode = 0;

// Sensors
sensorX = x;
sensorY = y;
sensorCos = dcos(angle);
sensorSin = dsin(angle);
drawSensors = false;

// Sensor position
sensorMainYDist = 0;

sensorLeftDistance = 7;
sensorRightDistance = 7;

sensorBottomDistance = 12;
sensorTopDistance = 10;

sensorMidDistance = 0;

bottomCollision = false;
edgeCollision = false;


xTopSpeed = 14;
    xMaxSpeed = 20;
    xAcceleration = 0.1;
    xFriction = 0.09;

    yGravity = 0.235;
    jumpStrength = -7.5;