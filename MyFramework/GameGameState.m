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
        self.current_level = 1;
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
        if (self.current_level != 1 && self.current_level > self.level.maximum_level) {
            
            [gameManager doStateChange:[WinGameGameState class]];
            
        } else {
            
            self.level = [[Level alloc] initWithLevel:self.current_level];
            self.Is_new_animation = YES;
            self.current_path = [[NSMutableArray alloc] initWithArray:@[]];
            
        }
        
    }
    
    // to do: if animation_changed
    // build animation_array
    // play animation
    if (self.Is_new_animation == YES) {
        
        self.animation_to_play = [[Animation alloc] initWithPath:self.current_path];
        NSLog(@"New animation comes here with the following path: %@", self.animation_to_play.movie.animationImages[0]);
        
    }
    
    
    // to do: if no active_buttons
      // if no camino_misterioso then doStateChange --> game over
      // if camino_misterioso
        // doStateChange --> you win the level
        // level++
       // _current_level = [_current_level doNextLevel];
    
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
    CGContextSetFillColorWithColor(g, [UIColor lightGrayColor].CGColor);
    CGContextFillRect(g, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    // draw text in black
    CGContextSetFillColorWithColor(g, [UIColor blackColor].CGColor);
    [@"Rendered from Game Game State" drawAtPoint:CGPointMake(10.0, 20.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [@"Double tap for the Main Menu" drawAtPoint:CGPointMake(10.0, 80.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    
    [self.status drawAtPoint:CGPointMake(10.0, 200.0) withFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    
    
    // draw the required animation if any
    if (self.Is_new_animation == YES) {
        
        self.Is_new_animation = NO;
        [self.animation_to_play.movie startAnimating];
        NSLog(@"Acabo de mostrar la movie");
        
//        [imageView setAnimationDuration:1.0];
//        [x startAnimating];
//        x.image = [imgArray lastObject];
//        [self.view addSubview:x];
//        [x release];
        
        UIImage *stopImage = [UIImage imageNamed:@"win_1.png"];
        UIImageView *stopImageView = [ [UIImageView alloc] initWithImage:stopImage];
        stopImageView.frame = CGRectMake(60, 95, 86, 193);
        [self addSubview:stopImageView];
        
    }
    
}


@end
