//
//  Animation.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 06/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "Animation.h"

@implementation Animation


- (Animation *)initWithPath:(NSString *)animacion_key andLevel:(NSInteger)level{
    if (self = [super init]) {
        
        self.movie = [[UIImageView alloc] initWithFrame:CGRectMake(120, 125, 86, 193)];
        self.movie.animationImages = [self findMovieFromPath:animacion_key andLevel:level];
        self.movie.animationDuration = 0.5;
        self.movie.animationRepeatCount = 1;
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

