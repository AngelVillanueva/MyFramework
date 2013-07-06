//
//  GameStateManager.h
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 04/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameStateManager : NSObject

@property NSInteger next_level;
@property NSInteger maximum_level;

- (void) doStateChange:(Class) state;

@end
