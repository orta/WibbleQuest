//
//  Store.h
//  WibbleQuest
//
//  Created by pH on 7/17/11.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import <Foundation/Foundation.h>
#import "Person.h"

// Warnings, this object is still untested in the real world

@interface Store : Person {}

@property (strong) NSMutableArray* items;

-(void)beforeTrading;
-(void)afterTrading;

-(void)showStoreInventory;
-(void)buyItem:(NSArray*)conditions;

-(void)addItemOfClass:(Class)class withValue:(int) value;
@end
