//
//  AppDelegate.h
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 04/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "GameStateManager.h"
#include "MainMenuGameState.h"

@interface AppDelegate : GameStateManager <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;

- (void) gameLoop:(id)sender;

@end
