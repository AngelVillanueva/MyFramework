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
        // read animacion properties from Levels plist
        NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Levels" ofType:@"plist"]];
        NSString *levelKey = [NSString stringWithFormat:@"%d", level];
        NSDictionary *levelDictionary = [mainDictionary objectForKey:levelKey];
        NSDictionary *animacionDictionary = [levelDictionary objectForKey:@"animacion"];
        // assign position and measures
        CGFloat x = [[animacionDictionary objectForKey:@"xPos"] floatValue];
        CGFloat y = [[animacionDictionary objectForKey:@"yPos"] floatValue];
        CGFloat w = [[animacionDictionary objectForKey:@"width"] floatValue];
        CGFloat h = [[animacionDictionary objectForKey:@"height"] floatValue];
        self.movie = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        // assign images and duration
        self.movie.animationImages = [self findMovieFromPath:animacion_key andLevel:level];
        self.stopImage = [self.movie.animationImages objectAtIndex:0];
        self.movie.animationDuration = self.movie.animationImages.count / (double)30;
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

