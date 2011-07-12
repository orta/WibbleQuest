//
//  PlayerInventory.h
//  MyBoots
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface PlayerInventory : NSObject

@property (retain) NSMutableArray * items;

-(void)addItem:(Item*) item;
-(void)describeInventory;

@end
