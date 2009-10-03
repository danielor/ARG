//
//  ARGMazeViewController.h
//  ARGMaze
//
//  Created by Daniel  Ortiz on 10/3/09.
//  Copyright 2009 University Michigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>

typedef  enum  {
	StartGame,
	StartLevel,
	EndLevel,
	EndGame,
} gameStates;

#define MAZE_CONNSTANT 100 /* Multiply by the level to get the grid dimension for maze */

@interface ARGMazeViewController : UIViewController {
	IBOutlet UIImageView * person;			/* The person that moves around the map - could be a dot*/
	NSMutableArray * arrayOfMazeBlocks;		/* An array of UIImageViews */
	UIImage * mazeBlocks;					/* The blocks of maze in the games */
	NSInteger gameState;					/* The state of the game */
	NSInteger level;						/* The level of the game */
	NSTimer * gameTimer;					/* Game Timer */
	CGPoint startPoint;						/* The start point in the maze */
	CGPoint endPoint;						/* The end point of the maze */
}

@property(nonatomic, retain) IBOutlet UIImageView * person;
@property(nonatomic) NSInteger gameState;
@property(nonatomic, retain) NSMutableArray * arrayOfMazeBlocks;
@property(nonatomic, retain) UIImage * mazeBlocks;
@property(nonatomic, retain) NSTimer * gameTimer;
@property(nonatomic, retain) CGPoint startPoint;
@property(nonatomic, retain) CGPoint endPoint;

-(void)gameLoop;

@end
