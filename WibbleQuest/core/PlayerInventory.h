//
//  PlayerInventory.h
//  WibbleQuest
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import <Foundation/Foundation.h>

@class Item;

@interface PlayerInventory : NSObject

@property (retain) NSArray * items;

-(void)describeInventory;

-(void)addItem:(Item*) item;
-(Item *)getItem:(NSString*) itemID;

-(BOOL)hasItem:(NSString*) itemID;

-(void)removeItemByID:(NSString*) itemID;
-(void)removeItem:(Item*) item;

-(BOOL) _respond:(NSString *)command;

@end
