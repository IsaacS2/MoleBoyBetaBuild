/// @description Basic stats and values for the game!


//
// Game By Isaac Sanchez
// Started Summer 2022
//


//
// values for changing speed
//
moleBoySpeed = 1;
speedUp = 1;
speedChange = 0;
obstacleSpeed = 9;
// TODO: Alter when adding more screens/rooms
lay_id = layer_get_id("Background");
boundaryWidth = 16;  // for obj_boundary measure


//
// values that alter score/money
//
scoreMultiplier = 0.25 * speedUp;
currentScore = 0;
slowDown = 1;
moneyVal = 0;
currWinnings = 0;

//
// values for spawning rocks
//
minRockTimer = 20;
maxRockTimer = 40;
rockSpawner = irandom_range(minRockTimer, maxRockTimer);
rockWidth = 40;
minRockX = rockWidth;
maxRockX = room_width - rockWidth; //rockWidth;
rockLocation = irandom_range(minRockX, maxRockX);
rockCnt = 0;
rockInc = 1 * speedUp;

//
// values for spawning saws
//
minSawTimer = 40;
maxSawTimer = 60;
sawSpawner = irandom_range(minSawTimer, maxSawTimer);
sawWidth = 32;
minSawX = sawWidth;
maxSawX = room_width - sawWidth;
sawLocation = irandom_range(minSawX, maxSawX);
sawCnt = 0;
sawInc = 1 * speedUp;

//
// values for spawning worms
//
minWormTimer = 300;
maxWormTimer = 360;
wormSpawner = irandom_range(minWormTimer, maxWormTimer);
wormWidth = 64;
minWormX = (room_width / 2) - (wormWidth);
maxWormX = (room_width / 2) + (wormWidth);
wormLocation = irandom_range(minWormX, maxWormX);
wormCnt = 0;
wormInc = 1 * speedUp;

//
// values for spawning dug dirt patches
//
dirtSpawnVal = floor(10 / speedUp);
dirtSpawnCnt = 0;
dirtSlowCnt = 1;
maxDirtDistance = floor(96 / speedUp)

depth = -1;
