//
//  ARGtwoDMazeViewController.h
//  ARGtwoDMaze
//
//  Created by Daniel  Ortiz on 10/3/09.
//  Copyright 2009 University Michigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>

typedef  enum  {
	StartGame = 0,
	StartLevel,
	EndLevel,
	EndGame,
} gameStates;

typedef enum  {
	LEFT = 0,
	TOP,
	RIGHT,
	BOTTOM,
} boundaryStates;

#define twoDMaze_CONNSTANT 100 /* Multiply by the level to get the grid dimension for twoDMaze */
#define BLOCK_SIZE 8

@interface ARGMazeViewController : UIViewController {
	IBOutlet UIImageView * person;			/* The person that moves around the map - could be a dot*/
	NSMutableArray * arrayOftwoDMazeBlocks;		/* An array of UIImageViews */
	UIImage * twoDMazeBlocks;					/* The blocks of twoDMaze in the games */
	NSInteger gameState;					/* The state of the game */
	NSInteger level;						/* The level of the game */
	NSTimer * gameTimer;					/* Game Timer */
	CGPoint startPoint;						/* The start point in the twoDMaze */
	CGPoint endPoint;						/* The end point of the twoDMaze */
}

@property(nonatomic, retain) IBOutlet UIImageView * person;
@property(nonatomic) NSInteger gameState;
@property(nonatomic, retain) NSMutableArray * arrayOftwoDMazeBlocks;
@property(nonatomic, retain) UIImage * twoDMazeBlocks;
@property(nonatomic, retain) NSTimer * gameTimer;
@property(nonatomic) CGPoint startPoint;
@property(nonatomic) CGPoint endPoint;

-(void)gameLoop;


@end
