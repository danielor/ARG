//
//  ARGtwoDMazeAppDelegate.m
//  ARGtwoDMaze
//
//  Created by Daniel  Ortiz on 10/3/09.
//  Copyright University Michigan 2009. All rights reserved.
//

#import "ARGMazeAppDelegate.h"
#import "ARGMazeViewController.h"

@implementation ARGMazeAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	application.idleTimerDisabled = YES; // we don't want the screen to sleep during our game 
	
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end
