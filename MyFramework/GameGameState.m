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
#import "Movimiento.h"


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
            self.buttons_added = NO;
            self.current_path = [[NSMutableArray alloc] initWithCapacity:self.level.movimientos.count];
            self.active_buttons = self.level.movimientos.count;
            self.Can_finish_level = YES;
            self.animation_key = @"0";
        }
    }
    

    // create animation movie if needed
    if (self.Is_new_animation == YES) {
        self.Can_finish_level = NO;
        self.animation_to_play = [[Animation alloc] initWithPath:self.animation_key andLevel:self.current_level];
    }
    
    
    // to do: if no active_buttons
    if (self.active_buttons == 0 && self.Can_finish_level == YES) {
        // GAME OVER if no active buttons and no winning path
        if (![self.current_path isEqualToArray:self.level.camino_misterioso]) {
            [gameManager doStateChange:[GameOverGameState class]];
        } else {
            gameManager.next_level++;
            [gameManager doStateChange:[WinLevelGameState class]];
        }
    }
    

    // add active buttons if not added yet
    if (self.buttons_added == NO) {
        for (int i = 0; i < self.level.movimientos.count; i++) {
            // create button based on Level plist --> Movimiento plist
            NSString *movimientoKey = [ NSString stringWithFormat:@"%@", self.level.movimientos[i] ];
            CGFloat x = [self.level.posiciones[i][0] floatValue];
            CGFloat y = [self.level.posiciones[i][1] floatValue];
            UIButton *button = [Movimiento forKey:movimientoKey andXpos:x andYpos:y];
            // link button to action
            [ button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside ];
            // add button to View
            [self addSubview:button];
            // not draw the buttons again
            self.buttons_added = YES;   
        }
    }
    
}

- (void)render {
    
    // to do: draw level incluiding active / inactive buttons
    
    // send the Animation movie to the drawRect method if required
    if (self.Is_new_animation == YES) {
        [self addSubview:self.animation_to_play.movie];
    }
    
    [self setNeedsDisplay];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    NSUInteger numTaps = [touch tapCount];
    
    // Back to the main menu screen double taping
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
    CGContextSetFillColorWithColor(g, [UIColor whiteColor].CGColor);
    CGContextFillRect(g, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    // draw text in black
    CGContextSetFillColorWithColor(g, [UIColor lightGrayColor].CGColor);
    [@"CAMINO MISTERIOSO" drawAtPoint:CGPointMake(80.0, 30.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [@"Double tap for the Main Menu" drawAtPoint:CGPointMake(70.0, 50.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    
    
    
    self.status = [NSString stringWithFormat:@"current level: %d", self.current_level]; //debug
    [self.status drawAtPoint:CGPointMake(120.0, 440.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    
    
    // draw the required animation if any
    if (self.Is_new_animation == YES) {
        self.Is_new_animation = NO;
        // remove stopImage from previous Animation
        [[self viewWithTag:999] removeFromSuperview];
        // start animation
        [self.animation_to_play.movie startAnimating];
        // callback to show a fix image at the end
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self
                                       selector:@selector(animationDone:)
                                       userInfo:nil repeats:NO];
    }
    
}

- (IBAction)buttonPressed:(id)sender {
    // substracts one from active_button to check if the game is over
    self.active_buttons--;
    // inactive already pressed button
    UIButton *thisButton = (UIButton *)sender;
    thisButton.enabled = NO;
    // add the button action to the current path, looking for the Camino Misterioso
    NSString *path = thisButton.titleLabel.text;
    [self.current_path addObject:path];
    // concatenate the button tag with the previous chain to build the animation key to select the right frames in plist
    self.animation_key = [ NSString stringWithFormat:@"%@%@", self.animation_key, [@(thisButton.tag)  stringValue]];
    // trigger new animation
    self.Is_new_animation = YES;
}

// callback on animationDone to swap last movie frame for a fix image
- (void)animationDone:(NSTimer*)inTimer
{
    [inTimer invalidate];
    inTimer = nil;
    // recover stopImage for a given animation
    UIImageView *stopImageView = [ [UIImageView alloc] initWithImage:self.animation_to_play.stopImage];
    stopImageView.frame = self.animation_to_play.movie.frame;
    // set tag to stopImage to pave the road for its future removal
    stopImageView.tag = 999;
    // add stopImage to view
    [self addSubview:stopImageView];
    // allow the level to finish if no active buttons left
    self.Can_finish_level = YES;
   
}


@end
