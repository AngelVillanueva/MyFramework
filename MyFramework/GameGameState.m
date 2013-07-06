//
//  MainGameState.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 04/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "GameGameState.h"
#import "MainMenuGameState.h"
#import "WinGameGameState.h"
#import "WinLevelGameState.h"
#import "GameOverGameState.h"
#import "Animation.h"


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
        // As it is a new game, then let's set the current level as the first one
        self.current_level = gameManager.next_level;
        // Flag that level has changed (so we will need to init the new one - later: update method)
        self.Is_new_level = YES;
    }
    
    return self;
    
}

- (void) update {
    
    // If this is a new level we need to initialized it
    if (self.Is_new_level == YES) {
        self.Is_new_level = NO;
        // If there are no more levels to load then load the WinGame state: kudos, you Won the Game! (except if this is the first level, which is always loaded)
        if (self.current_level != 1 && self.current_level > gameManager.maximum_level) {
            [gameManager doStateChange:[WinGameGameState class]];
        } else {
            self.level = [[Level alloc] initWithLevel:self.current_level];
            self.Is_new_animation = YES;
            self.current_path = [[NSMutableArray alloc] initWithArray:@[]];
            self.active_buttons = [self.level.movimientos count];
        }
    }
    

    // create animation movie if needed
    if (self.Is_new_animation == YES) {
        self.animation_to_play = [[Animation alloc] initWithPath:self.current_path];
    }
    
    
    // to do: if no active_buttons
    if (self.active_buttons == 0) {
        // GAME OVER if no active buttons and no winning path
        if (self.current_path != self.level.camino_misterioso) {
            [gameManager doStateChange:[GameOverGameState class]];
        } else {
            gameManager.next_level++;
            [gameManager doStateChange:[WinLevelGameState class]];
        }
    }
    
    NSString *mensaje = [NSString stringWithFormat:@"ala, status of level is %@",self.level.estado];
    self.status = mensaje;
}

- (void) render {
    
    // to do: draw level incluiding active / inactive buttons
    
    // send the Animation movie to the drawRect method if required
    if (self.Is_new_animation == YES) {
        [self addSubview:self.animation_to_play.movie];
    }
    
    
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
    CGContextSetFillColorWithColor(g, [UIColor whiteColor].CGColor);
    CGContextFillRect(g, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    // draw text in black
    CGContextSetFillColorWithColor(g, [UIColor lightGrayColor].CGColor);
    [@"Rendered from Game Game State" drawAtPoint:CGPointMake(60.0, 30.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [@"Double tap for the Main Menu" drawAtPoint:CGPointMake(70.0, 50.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    
    [self.status drawAtPoint:CGPointMake(20.0, 440.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    
    
    // draw the required animation if any
    if (self.Is_new_animation == YES) {
        self.Is_new_animation = NO;
        [self.animation_to_play.movie startAnimating];
        // callback to show a fix image at the end
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self
                                       selector:@selector(animationDone:)
                                       userInfo:nil repeats:NO];
    }
    
}

// callback on animationDone to swap last movie frame for a fix image
-(void)animationDone:(NSTimer*)inTimer
{
    [inTimer invalidate];
    inTimer = nil;
    UIImage *stopImage = [UIImage imageNamed:@"win_1.png"];
    UIImageView *stopImageView = [ [UIImageView alloc] initWithImage:stopImage];
    stopImageView.frame = CGRectMake(120, 95, 86, 193);
    [self addSubview:stopImageView];
}


@end
