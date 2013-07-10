//
//  Animation.h
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 06/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animation : NSObject

@property UIImageView *movie;
@property UIImage *stopImage;

- (Animation *)initWithPath:(NSString *)animation_key andLevel:(NSInteger)level;
- (NSMutableArray *)findMovieFromPath:(NSString *)animation_key andLevel:(NSInteger)level;

@end
