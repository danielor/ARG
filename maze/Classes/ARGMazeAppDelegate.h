//
//  ARGtwoDMazeAppDelegate.h
//  ARGtwoDMaze
//
//  Created by Daniel  Ortiz on 10/3/09.
//  Copyright University Michigan 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ARGMazeViewController;

@interface ARGMazeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ARGMazeViewController * viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ARGMazeViewController *viewController;

@end

