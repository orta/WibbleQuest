//
//  Inventory.h
//  WibbleQuest
//
//  Created by Michael Jaoudi on 8/9/11.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerInventory.h"

//A wrapper class that allows you to call class methods to access your inventory.
@interface Inventory : NSObject

// Add Item add's an Item into the Player's inventory.
+(void)addItem:(Item*) item;

// Has Item checks to see if there is an Item with the same ID in the inventory.
+(BOOL)hasItem:(NSString*) itemID;
// Contains does the same thing, but might make for more readable code for some.
+(BOOL)contains:(NSString*) itemID;

// Get Item removes the item with the ID from the Inventory and returns it.
+(Item *)getItem:(NSString*) itemID;
// Remove an Item by it's ID.
+(void)removeItemByID:(NSString*) itemID;
// Remove an Item when you have a reference to the object.
+(void)removeItem:(Item*) item;

@end
