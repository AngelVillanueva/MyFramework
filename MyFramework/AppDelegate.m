//
//  AppDelegate.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 04/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // set viewController from root ViewController
    viewController  = window.rootViewController;
    
    // set up main loop
    [NSTimer scheduledTimerWithTimeInterval:0.033 target:self selector:@selector(gameLoop:) userInfo:nil repeats:NO];
    
    // create instance of the first Game State (main)
    [self doStateChange:[MainGameState class]];
    
    return YES;
}

- (void) gameLoop:(id) sender {
    
    // Update and Render the actual view
    [(GameState *)viewController.view update];
    [(GameState *)viewController.view render];
    
    // And loop again
    [NSTimer scheduledTimerWithTimeInterval:0.033 target:self selector:@selector(gameLoop:) userInfo:nil repeats:NO];
    
    
}

- (void) doStateChange:(Class)state {
    
    if (viewController.view != nil) {
        
        // remove view from window's subviews.
        [viewController.view removeFromSuperview];
        // release game state is not longer needed with ARC, before was also [_viewController.view release]
        
    }
    
    // creates the new game state (remember: a view)
    viewController.view = [[state alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT) andManager:self];
    
    // now set our view as visible
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
