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
        
        // Load the file content and read the data into arrays
        NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Levels" ofType:@"plist"]];
        NSString *levelKey = [NSString stringWithFormat:@"%d", level];
        NSDictionary *levelDictionary = [mainDictionary objectForKey:levelKey];
        
        // To print out all key-value pairs in the NSDictionary myDict
        for(id key in levelDictionary)
            NSLog(@"key=%@ value=%@", key, [levelDictionary objectForKey:key]);
        
        int movimientos = [levelDictionary objectForKey:@"movimientos"];
        NSLog(@"movimientos=%@", movimientos);
        
        
    }
    
    return self;
}

//- (Level *) doNextLevel {
//    
//    self.estado = @"Subio de nivel";
//    
//    return self;
//    
//}

@end
