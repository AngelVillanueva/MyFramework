//
//  MainGameState.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 04/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "GameGameState.h"
#import "MainMenuGameState.h"

@implementation GameGameState

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
        
        NSLog(@"Game Game State initialized");
        // As it is a new game, then let's create the first level
        self.current_level = 1;
        self.level = [[Level alloc] initWithLevel:self.current_level];
        self.Is_new_level = NO;
        
    }
    
    return self;
    
}

- (void) update {
    
    // to do: if level_changed then loadLevel()
    if (self.Is_new_level) {
        self.level = [[Level alloc] initWithLevel:self.current_level];
        self.Is_new_level = NO;
    }
    
    // to do: if animation_changed
    // build animation_array
    // play animation
    
    // to do: if no active_buttons
      // if no camino_misterioso then doStateChange --> game over
      // if camino_misterioso
        // if level == max_level then doStateChane --> you win the game
        // else doStateChange --> you win the level
        // level++
       // _current_level = [_current_level doNextLevel];
    
    NSString *mensaje = [NSString stringWithFormat:@"ala, status of level is %@",self.level.estado];
    self.status = mensaje;
}

- (void) render {
    
    // to do: draw level incluiding active / inactive buttons
    // to do: draw scene including animation if animation_changed
    
    [self setNeedsDisplay];
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    NSUInteger numTaps = [touch tapCount];
    
    // Back to the main menu screen double taping
    if (numTaps > 1) {
        
        [gameManager doStateChange:[MainMenuGameState class]];
        
    }
    
    // to do: this active_button --> inactive()
    // to do: flag animation_changed
     
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    CGContextRef g = UIGraphicsGetCurrentContext();
    
    // fill background with gray
    CGContextSetFillColorWithColor(g, [UIColor lightGrayColor].CGColor);
    CGContextFillRect(g, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    // draw text in black
    CGContextSetFillColorWithColor(g, [UIColor blackColor].CGColor);
    [@"Rendered from Game Game State" drawAtPoint:CGPointMake(10.0, 20.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [@"Double tap for the Main Menu" drawAtPoint:CGPointMake(10.0, 80.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    
    [_status drawAtPoint:CGPointMake(10.0, 200.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
}


@end
