//
//  Inventory.h
//  WibbleQuest
//
//  Created by Michael Jaoudi on 8/9/11.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerInventory.h"


//A wrapper class that allows you to call class methods to access your inventory
@interface Inventory : NSObject
+(void)describeInventory;

+(void)addItem:(Item*) item;
+(Item *)getItem:(NSString*) itemID;

+(BOOL)hasItem:(NSString*) itemID;

+(void)removeItemByID:(NSString*) itemID;
+(void)removeItem:(Item*) item;

+(BOOL)didRespondToCommand:(NSArray*) commands;
@end
