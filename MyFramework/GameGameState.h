//
//  MainGameState.h
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 04/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "GameState.h"
#import "Level.h"

@interface GameGameState : GameState

@property (strong, nonatomic) Level *level;
@property NSInteger current_level;
@property BOOL Is_new_level;

@property NSString *status;

@end
