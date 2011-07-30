//
//  Store.h
//  WibbleQuest
//
//  Created by pH on 7/17/11.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Store : WibbleObject {}

@property (retain) NSMutableArray* items;

-(void) beforeTrading;
-(void) afterTrading;

-(void)showInventory;
-(void)buyItem:(NSArray*)conditions;

-(void)addItemOfClass:(Class)class withValue:(int) value;
@end
