//
//  MainGameState.h
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 04/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "GameState.h"
#import "Level.h"
#import "Animation.h"

@interface GameGameState : GameState

@property (strong, nonatomic) Level *level;
@property NSInteger current_level;
@property BOOL Is_new_level;
@property BOOL Is_new_animation;
@property NSMutableArray *current_path;
@property (strong,nonatomic) Animation *animation_to_play;
@property NSInteger active_buttons;

@property NSString *status;

- (void)animationDone:(NSTimer *)inTimer;

@end
