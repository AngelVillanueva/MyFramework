//
//  Level.h
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 05/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject

@property (strong, nonatomic) NSString *estado;
@property (strong, nonatomic) NSArray *movimientos;
@property (strong, nonatomic) NSArray *animaciones;
@property (strong, nonatomic) NSArray *camino;
@property (strong, nonatomic) NSArray *camino_misterioso;

- (Level *) initWithLevel:(NSInteger)level;
- (Level *) doNextLevel;

@end
