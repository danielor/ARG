//
//  ExtendedRealityGamesAppDelegate.m
//  ExtendedRealityGames
//
//  Created by Daniel  Ortiz on 10/2/09.
//

#import "ExtendedRealityGamesAppDelegate.h"
#import "EAGLView.h"

@implementation ExtendedRealityGamesAppDelegate

@synthesize window;
@synthesize glView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	glView.animationInterval = 1.0 / 60.0;
	[glView startAnimation];
}


- (void)applicationWillResignActive:(UIApplication *)application {
	glView.animationInterval = 1.0 / 5.0;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	glView.animationInterval = 1.0 / 60.0;
}


- (void)dealloc {
	[window release];
	[glView release];
	[super dealloc];
}

@end
