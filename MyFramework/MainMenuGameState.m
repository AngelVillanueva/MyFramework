//
//  MainMenuGameState.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 05/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "MainMenuGameState.h"
#import "GameGameState.h"

@implementation MainMenuGameState

@synthesize subview;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame andManager:(GameStateManager *)manager {
    
    if (self = [super initWithFrame:frame andManager:manager]) {
        
        // load the MainMenu.xib file
        [[NSBundle mainBundle] loadNibNamed:@"MainMenu" owner:self options:nil];
        
        // add subview as... subview
        [self addSubview:subview];
        
    }
    
    return self;
}

- (IBAction)doGoGame:(id)sender {
    
    [gameManager doStateChange:[GameGameState class]];
    
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
