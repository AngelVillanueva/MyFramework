//
//  Level.m
//  MyFramework
//
//  Created by Angel Villanueva Pérez on 05/07/13.
//  Copyright (c) 2013 Angel Villanueva Pérez. All rights reserved.
//

#import "Level.h"

@implementation Level

- (Level *) init {
    
    if (self = [super init]) {
        
        self.estado = @"I'm just created";
        
    }
    
    return self;
}

- (Level *) initWithLevel:(NSInteger)level {
    
    if (self = [super init]) {
        
        self.estado = [NSString stringWithFormat:@"I'm just created and I'm %d", level ];
        self.maximum_level = level * 2;
        
    }
    
    return self;
}

- (Level *) doNextLevel {
    
    self.estado = @"Subio de nivel";
    
    return self;
    
}

@end
