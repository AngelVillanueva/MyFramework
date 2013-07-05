//
//  MainMenuGameState.h
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 05/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "GameState.h"

@interface MainMenuGameState : GameState

@property (strong, nonatomic) IBOutlet UIView *subview;

- (IBAction)doGoGame:(id)sender;
- (IBAction)doGoHelp:(id)sender;
- (IBAction)doGoFame:(id)sender;

@end
