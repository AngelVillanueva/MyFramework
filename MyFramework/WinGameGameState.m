//
//  WinGameGameState.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 06/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "WinGameGameState.h"
#import "MainMenuGameState.h"

@implementation WinGameGameState

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
        
        NSLog(@"Win Game State initialized");
        
    }
    
    return self;
    
}

- (void) render {
    
    [self setNeedsDisplay];
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    NSUInteger numTaps = [touch tapCount];
    
    // todo: implement touch code
    if (numTaps > 1) {
        
        [gameManager doStateChange:[MainMenuGameState class]];
        
    }
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    CGContextRef g = UIGraphicsGetCurrentContext();
    
    // fill background with gray
    CGContextSetFillColorWithColor(g, [UIColor purpleColor].CGColor);
    CGContextFillRect(g, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    // draw text in black
    CGContextSetFillColorWithColor(g, [UIColor whiteColor].CGColor);
    [@"Rendered from Win Game State" drawAtPoint:CGPointMake(10.0, 20.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [@"KUDOS, YOU WIN THE GAME!!!" drawAtPoint:CGPointMake(10.0, 80.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [@"Double tap for the Main Menu" drawAtPoint:CGPointMake(10.0, 200.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
}


@end