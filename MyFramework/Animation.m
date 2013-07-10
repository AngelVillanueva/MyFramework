//
//  Animation.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 06/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "Animation.h"

@implementation Animation

- (Animation *)initWithPath:(id)current_path {
    
    if (self = [super init]) {
        
        self.movie = [[UIImageView alloc] initWithFrame:CGRectMake(120, 125, 86, 193)];
        self.movie.animationImages = [self findMovieFromPath:current_path];
        self.movie.animationDuration = 0.5;
        self.movie.animationRepeatCount = 1;
        
        NSLog(@"es %@", current_path);
        
    }
    
    return self;
    
}

- (NSMutableArray *)findMovieFromPath:current_path {
    
    // Load images
    NSArray *imageNames = @[@"win_1.png", @"win_2.png", @"win_3.png", @"win_4.png",
                            @"win_5.png", @"win_6.png", @"win_7.png", @"win_8.png",
                            @"win_9.png", @"win_10.png", @"win_11.png", @"win_12.png",
                            @"win_13.png", @"win_14.png", @"win_15.png", @"win_16.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    return images;
    
    
}

- (Animation *)initWithPath:(NSString *)animacion_key andLevel:(NSInteger)level{
    
    if (self = [super init]) {
        
        self.movie = [[UIImageView alloc] initWithFrame:CGRectMake(120, 125, 86, 193)];
        self.movie.animationImages = [self findMovieFromPath:animacion_key andLevel:level];
        self.movie.animationDuration = 0.5;
        self.movie.animationRepeatCount = 1;
        
        NSLog(@"es %@", animacion_key);
        
    }
    
    return self;
    
}

- (NSMutableArray *)findMovieFromPath:(NSString *)animation_key andLevel:(NSInteger)level {
    
    NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Animaciones" ofType:@"plist"]];
    NSString *levelKey = [NSString stringWithFormat:@"Level %d", level];
    NSDictionary *animacionDictionary = [mainDictionary objectForKey:levelKey];
    
    // Load images
    NSArray *imageNames = [animacionDictionary objectForKey:animation_key];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    return images;
    
    
}

@end

