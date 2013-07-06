//
//  MainMenuGameState.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 05/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "MainMenuGameState.h"
#import "GameGameState.h"
#import "HelpGameState.h"
#import "FameGameState.h"


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
    
    gameManager.next_level = INITIAL_LEVEL;
    gameManager.maximum_level = MAX_LEVEL;
    [gameManager doStateChange:[GameGameState class]];
    
}

- (IBAction)doGoHelp:(id)sender {
    
    [gameManager doStateChange:[HelpGameState class]];
    
}

- (IBAction)doGoFame:(id)sender {
    
    [gameManager doStateChange:[FameGameState class]];
    
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
