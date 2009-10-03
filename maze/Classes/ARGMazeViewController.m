//
//  ARGtwoDMazeViewController.m
//  ARGtwoDMaze
//
//  Created by Daniel  Ortiz on 10/3/09.
//  Copyright 2009 University Michigan. All rights reserved.
//

#import "ARGMazeViewController.h"


@implementation ARGMazeViewController

@synthesize person, arrayOftwoDMazeBlocks, twoDMazeBlocks, gameState, gameTimer, startPoint, endPoint

-(void) viewDidLoad {
	[super viewDidLoad];
	
	/* Start with the first level */
	level = 1;
	gameState = StartGame;
	arrayOftwoDMazeBlocks = [[NSMutableArray alloc] init];
	twoDMazeBlocks = [UIImage imageNamed:@"block.png"];
	
	// Start the game loop
	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
}

-(void) gameLoop {
	static int counter = 0;
	
	/* The controller of the game */
	switch (self.gameState) {
		case StartGame:
			break;
		case EndLevel:
			break;
		case StartLevel:
			break;
		case EndGame:
			break;
		default:
			break;
	}
}

-(void) swap: (int *)First second:(int*)Second{
	int value = *First;
	*First = *Second;
	*Second = value;
}


-(void) loadLevel{
	int size = level * twoDMaze_CONNSTANT + 1;
	int twoDMaze[twoDMaze_Size][twoDMaze_Size];
	
	// Draw the outer walls
	for(int i = 0; i != size; ++i){
		twoDMaze[0][i] = 1;
		twoDMaze[size - 1][i] = 1;
		twoDMaze[i][0] = 1;
		twoDMaze[i][size - 1] = 1;
	}	
	
	// Draw pillars
	for (int y=2; y!=size-1; y+=2)
	{
		for (int x=2; x!=size-1; x+=2)
		{
			twoDMaze[y][x] = 1;
		}
	}
	
	//Check around pillars
	const int nWallsToAdd = ((size / 2) - 1) * ((size / 2) - 1);
	for (int i=0; i!=nWallsToAdd; )
	{
		for (int y=2; y!=size-1; y+=2)
		{
			for (int x=2; x!=size-1; x+=2)
			{
				const int nWalls
				= (twoDMaze[y-1][x] == 0 ? 0 : 1)
				+ (twoDMaze[y+1][x] == 0 ? 0 : 1)
				+ (twoDMaze[y][x+1] == 0 ? 0 : 1)
				+ (twoDMaze[y][x-1] == 0 ? 0 : 1);
				if ( nWalls == 0)
				{
					switch(arc4random() % 4)
					{
						case 0: twoDMaze[y-1][x] = 1; break;
						case 1: twoDMaze[y+1][x] = 1; break;
						case 2: twoDMaze[y][x+1] = 1; break;
						case 3: twoDMaze[y][x-1] = 1; break;
					}
					++i;
				}
				else if (nWalls == 1)
				{
					switch(arc4random() % 6)
					{
						case 0: swap(&&twoDMaze[y-1][x], &twoDMaze[y+1][x]); break;
						case 1: swap(&twoDMaze[y-1][x], &twoDMaze[y][x+1]); break;
						case 2: swap(&twoDMaze[y-1][x], &twoDMaze[y][x-1]); break;
						case 3: swap(&twoDMaze[y+1][x], &twoDMaze[y][x+1]); break;
						case 4: swap(&twoDMaze[y+1][x], &twoDMaze[y][x-1]); break;
						case 5: swap(&twoDMaze[y][x+1], &twoDMaze[y][x-1]); break;
					}
				}
			}
		}
	}
	
	// The counts to deside where the maze begins and ends
	int leftBoundaryCount = 0;
	int topBoundaryCount = 0;
	int rightBoundaryCount = 0;
	int bottomBoundaryCount = 0;
	
	// The location of the start and end point
	int startPointBoundary = arc4random() % 4;	/* LEFT, TOP, RIGHT, BOTTOM */
	int endPointBoundary = startPointBoundary;
	
	// Make sure the start and end point are on a different boundary.
	while (endPointBoundary == startPointBoundary) {
		endPointBoundary = arc4random() % 4;
	}
	
	
	// Draw the maze
	for(int x = 0; x < size; x++){
		for(int y = 0; y < size; y++){
			if(twoDMaze[x][y]){
				// Get the boundary count
				if(x == 0){
					leftBoundaryCount = leftBoundaryCount + 1;
				}
				if(y == 0){
					bottomBoundaryCount = bottomBoundaryCount + 1;
				}
				if(x == (size -1)){
					rightBoundaryCount = rightBoundaryCount + 1;
				}
				if(y == (size -1)){
					topBoundaryCount = topBoundaryCount + 1;
				}
				
				// Create the box
				CGRect box = CGRectMake(BLOCK_SIZE * x, BLOCK_SIZE * y, BLOCK_SIZE, BLOCK_SIZE);
				
				// Setup the image view
				UIImageView * block = [[UIImageView alloc] initWithImage:twoDMazeBlocks];
				block.frame = box;
				block.hidden = NO;
				
				// Add the image view to the current view
				[self.view addSubview:block];
				
				// Save a reference to the view 
				[arrayOftwoDMazeBlocks insertObject:block atIndex:[arrayOftwoDMazeBlocks count]];
				[block release];
			}
		}
	}
	

	
}



-(void) dealloc {
	self.person = nil;
	self.twoDMazeBlocks = nil;
	[arrayOftwoDMazeBlocks release];
	[super dealloc];
}

@end
