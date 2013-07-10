//
//  Movimiento.m
//  MyFramework
//
//  Created by Angel Villanueva Admin on 09/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "Movimiento.h"

@implementation Movimiento

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (UIButton *) forKey:(NSString *)key andXpos:(CGFloat)x andYpos:(CGFloat)y {
    
    NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Movimientos" ofType:@"plist"]];
    NSString *movimientoKey = [NSString stringWithFormat:@"%@", key];
    NSDictionary *movimientoDictionary = [mainDictionary objectForKey:movimientoKey];
    
    NSString *title = [movimientoDictionary objectForKey:@"title"];
    CGFloat w = [[movimientoDictionary objectForKey:@"width"] floatValue];
    CGFloat h = [[movimientoDictionary objectForKey:@"height"] floatValue];
    NSInteger tag = [[movimientoDictionary objectForKey:@"tag"] integerValue];
    UIImage *image = [UIImage imageNamed:[movimientoDictionary objectForKey:@"image"]];
    
    UIButton *new_button = [UIButton buttonWithType:(UIButtonType) UIButtonTypeCustom];
    [new_button setTitle:title forState:UIControlStateNormal];
    new_button.frame = CGRectMake(x, y, w, h);
    new_button.tag = tag;
    [new_button setImage:image forState:UIControlStateNormal];
    
    return new_button;
    
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
