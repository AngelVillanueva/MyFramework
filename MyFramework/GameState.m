//
//  GameState.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 04/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "GameState.h"

@implementation GameState

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andManager:(id)manager {
    
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        gameManager = manager;
        self.userInteractionEnabled = true;
    }
    
    return self;
    
}

- (void) update {
    
}

- (void) render {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
