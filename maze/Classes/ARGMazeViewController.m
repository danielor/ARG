//
//  ARGtwoDMazeViewController.m
//  ARGtwoDMaze
//
//  Created by Daniel  Ortiz on 10/3/09.
//  Copyright 2009 University Michigan. All rights reserved.
//

#import "ARGtwoDMazeViewController.h"


@implementation ARGtwoDMazeViewController

@synthesize person, arrayOftwoDMazeBlocks, twoDMazeBlocks, gameState, gameTimer, startPoint, endPoint

-(void) viewDidLoad {
	[super viewDidLoad];
	
	/* Start with the first level */
	level = 1;
	gameState = StartGame;
	
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

-(void) loadLevel{
	int twoDMaze_Size = level * twoDMaze_CONNSTANT + 1;
	int twoDtwoDMaze[twoDMaze_Size][twoDMaze_Size];
	
	// Draw the outer walls
	for(int i = 0; i != twoDMaze_Size; ++i){
		twoDtwoDMaze[0][i] = 1;
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
					switch(std::rand() % 4)
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
					switch(std::rand() % 6)
					{
						case 0: std::swap(twoDMaze[y-1][x], twoDMaze[y+1][x]); break;
						case 1: std::swap(twoDMaze[y-1][x], twoDMaze[y][x+1]); break;
						case 2: std::swap(twoDMaze[y-1][x], twoDMaze[y][x-1]); break;
						case 3: std::swap(twoDMaze[y+1][x], twoDMaze[y][x+1]); break;
						case 4: std::swap(twoDMaze[y+1][x], twoDMaze[y][x-1]); break;
						case 5: std::swap(twoDMaze[y][x+1], twoDMaze[y][x-1]); break;
					}
				}
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
