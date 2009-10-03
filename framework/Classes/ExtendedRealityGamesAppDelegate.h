//
//  ExtendedRealityGamesAppDelegate.h
//  ExtendedRealityGames
//
//  Created by Daniel  Ortiz on 10/2/09.
//

#import <UIKit/UIKit.h>

@class EAGLView;

@interface ExtendedRealityGamesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EAGLView *glView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EAGLView *glView;

@end

