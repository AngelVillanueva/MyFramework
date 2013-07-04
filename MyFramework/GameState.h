//
//  GameState.h
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 04/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameStateManager.h"

@interface GameState : UIView {
    GameStateManager *m_pManager;
}

- (id) initWithFrame:(CGRect)frame andManager:(GameStateManager *)pManager;
- (void) update;
- (void) render;

@end
