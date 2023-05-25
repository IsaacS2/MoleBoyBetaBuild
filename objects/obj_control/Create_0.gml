/// @description Basic stats and values for the game!


//
// Game By Isaac Sanchez
// Started Summer 2022
//

//
// TODO: Add randomize function when testing random values
//
//randomize();

//
// restart global values (since values may be reassigned after room_restart call,
// but before the end Mole Boy's end step event.
//
func_initialize_globals();

//
// values for changing speed
//
moleBoySpeed = 1;
// TODO: Alter when adding more screens/rooms
lay_id = layer_get_id("Background");
boundaryWidth = 16;  // for obj_boundary measure


//
// values that alter score/money
//
scoreMultiplier = 0.25 * global.currentExcavationSpeed;

//
// values for spawning rocks
//
minRockTimer = 20;
maxRockTimer = 40;
rockSpawner = irandom_range(minRockTimer, maxRockTimer);
rockWidth = 40;
minRockX = rockWidth;
maxRockX = room_width - rockWidth;
rockLocation = irandom_range(minRockX, maxRockX);
rockCnt = 0;
rockInc = 1 * global.currentExcavationSpeed;  // 1 may be replaced by var that better matches desired spawn rate later in dev

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
sawInc = 1 * global.currentExcavationSpeed;

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
wormInc = 1 * global.currentExcavationSpeed;

//
// values for spawning dug dirt patches
//
dirtSpawnVal = floor(10 / global.currentExcavationSpeed);
dirtSpawnCnt = 0;
dirtSlowCnt = 1;  // if global.rockSlowDown is insideRockSpeed, dirt patches will be spawned every other frames cause of this var
maxDirtDistance = floor(96 / global.currentExcavationSpeed)

depth = -1;
