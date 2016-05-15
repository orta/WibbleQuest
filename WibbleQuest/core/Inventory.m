//
//  Inventory.m
//  WibbleQuest
//
//  Created by Michael Jaoudi on 8/9/11.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Inventory.h"

@implementation Inventory

+(void)addItem:(Item*) item{
  [[WibbleQuest sharedWibble].inventory addItem:item];
}

+(Item *)getItem:(NSString*) itemID{
  return [[WibbleQuest sharedWibble].inventory getItem:itemID];
}

+(BOOL)contains:(NSString*) itemID{
  return [[WibbleQuest sharedWibble].inventory hasItem:itemID];
}

+(BOOL)hasItem:(NSString*) itemID{
  return [[WibbleQuest sharedWibble].inventory hasItem:itemID];
}

+(void)removeItemByID:(NSString*) itemID{
  [[WibbleQuest sharedWibble].inventory removeItemByID:itemID];
}

+(void)removeItem:(Item*) item{
  [[WibbleQuest sharedWibble].inventory removeItem:item];
}

@end
