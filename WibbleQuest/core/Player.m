//
//  Player.m
//  WibbleQuest
//
//  Created by orta therox on 15/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Player.h"
#import "PlayerInventory.h"

@implementation Player
@synthesize data = _data, health, maxHealth, damageRange, money, score;

//singleton
static Player * sharedPlayer;

+(BOOL) isIn:(NSString *)roomID {
  if ([[Room current].id isEqualToString:roomID]) {
    return YES;
  }
  return NO;
}

+(BOOL)has:(NSString*)itemID{
  return [Player hasItemByID:itemID];
}

+(void)removeItemByID:(NSString *)itemID {
  if ([Player hasItemByID:itemID]) {
    WibbleQuest *wq = [WibbleQuest sharedWibble];
    [wq.inventory removeItemByID:itemID];
  }
}

+(BOOL)hasItemByID:(NSString*)itemID {
  return [[WibbleQuest sharedWibble].inventory hasItem:itemID];
}

+(Item*)getItemByID:(NSString *)itemID{
  return [[WibbleQuest sharedWibble].inventory getItem:itemID];
}

+(Player*)sharedPlayer {
  if (sharedPlayer) return sharedPlayer;
  return [[Player alloc] init];
}

+(void)teleportToRoomWithID:(NSString*)roomID {
  Room * room = [Room getRoomByID:roomID];
  if (room) {
    WibbleQuest *wq = [WibbleQuest sharedWibble];
    [wq.currentRoom playerDidLeaveRoom];
    wq.currentRoom = room;
    [wq.currentRoom playerDidEnterRoom];
    [wq movedRoom];
  }else{
    NSLog(@"could not find room %@ for teleporting, are you sure it's got an id and has been added to WQ", roomID);
  }
}

-(id)init {
  self = [super init];
  self.data = [NSMutableDictionary dictionary];
  sharedPlayer = self;
  health = maxHealth;
  self.damageRange = NSMakeRange(-1, -1);
  return self;
}


+ (NSString*)getString:(NSString*)key {
  Player * player = [Player sharedPlayer];
  return [player.data objectForKey:key];
}

+ (void)setString:(NSString *)value forKey:(NSString *)key{
  Player * player = [Player sharedPlayer];
  return [player.data setValue:value forKey:key];
}

+ (int)getInt:(NSString*)key {
  Player * player = [Player sharedPlayer];
  return [[player.data objectForKey:key] intValue];
}

+ (void)setInt:(int)value forKey:(NSString *)key{
  Player * player = [Player sharedPlayer];
  return [player.data setValue:[NSString stringWithFormat:@"%d", value] forKey:key];
}

@end
