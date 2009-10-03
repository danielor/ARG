//
//  ARGtwoDMazeAppDelegate.h
//  ARGtwoDMaze
//
//  Created by Daniel  Ortiz on 10/3/09.
//  Copyright University Michigan 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAGLView;

@interface ARGtwoDMazeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EAGLView *glView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EAGLView *glView;

@end

