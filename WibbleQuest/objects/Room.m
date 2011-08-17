//
//  Room.m
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Room.h"

@implementation Room

@synthesize  north, east, west, south, items = _items, encounter, person, visited, store;

#pragma mark class methods

+(Room*)current {
  WibbleQuest * wq = [WibbleQuest sharedWibble];
  return wq.currentRoom;
}

+(void)connectRoomID:(NSString*)roomID1 connectNorthToRoomID:(NSString*)roomID2 {
  Room *room1=[[WibbleQuest sharedWibble] getRoomByID:roomID1];
  Room *room2=[[WibbleQuest sharedWibble] getRoomByID:roomID2];
  [room1 connectNorth:room2];
}
+(void)connectRoomID:(NSString*)roomID1 connectSouthToRoomID:(NSString*)roomID2 {
  Room *room1=[[WibbleQuest sharedWibble] getRoomByID:roomID1];
  Room *room2=[[WibbleQuest sharedWibble] getRoomByID:roomID2];
  [room1 connectSouth:room2];
}
+(void)connectRoomID:(NSString*)roomID1 connectWestToRoomID:(NSString*)roomID2 {
  Room *room1=[[WibbleQuest sharedWibble] getRoomByID:roomID1];
  Room *room2=[[WibbleQuest sharedWibble] getRoomByID:roomID2];
  [room1 connectWest:room2];
}
+(void)connectRoomID:(NSString*)roomID1 connectEastToRoomID:(NSString*)roomID2 {
  Room *room1=[[WibbleQuest sharedWibble] getRoomByID:roomID1];
  Room *room2=[[WibbleQuest sharedWibble] getRoomByID:roomID2];
  [room1 connectEast:room2];
}

+(Room *) getRoomByID:(NSString*)id {
  WibbleQuest *wibble = [WibbleQuest sharedWibble];
  return [wibble getRoomByID:id];
}

-(id)init{
  self = [super init];
  self.items = [NSArray array];

  // Add yourself into the wq rooms array
  WibbleQuest * wq = [WibbleQuest sharedWibble];
  [wq addRoom:self];
  return self;
}

-(void)addItem:(Item*) item {
  [item retain];
  self.items = [self.items arrayByAddingObject: item];
  item.location=self;
}

-(void)describeInventory {
  for ( Item *item in self.items) {
    [WQ print:[NSString stringWithFormat:@"%@", item.descriptionInRoom ]];
  }
}

-(BOOL)hasItem:(NSString*) itemID {
  for ( Item *item in self.items) {
    if([item.id isEqualToString:itemID]){
      return YES;
    }
  }
  return NO;
}

-(Item *)getItem:(NSString*) itemID {
  for ( Item *item in self.items) {
    if([item.id isEqualToString:itemID]){
      return item;
    }
  }
  return nil;
}

-(Item *)takeItem:(NSString *)itemID {
  for ( Item *item in self.items) {
    if([item.id isEqualToString:itemID]){
      NSMutableArray *tempItems = [self.items mutableCopy];
      [tempItems removeObject:item];
      item.location=nil;
      self.items = tempItems;
      [item release];
      return item;
    }
  }  
  return nil;
}

-(void)connectNorth:(Room*)room {
  self.north = room;
  room.south = self;
}

-(void)connectSouth:(Room*)room {
  self.south = room;
  room.north = self;
}

-(void)connectWest:(Room*)room {
  self.west = room;
  room.east = self;  
}

-(void)connectEast:(Room*)room {
  self.east = room;
  room.west = self;
}

-(void)examineWithInput:(NSString*)input {
  NSArray * commands = [input componentsSeparatedByString:@" "];
  if ([commands count] > 1) {
    NSString * key = [commands second];    
    NSString * itemDescription = [[self dictionaryForExamine] objectForKey:key];
    if (itemDescription != nil) {
      [WQ print:@"%@", itemDescription];  
    }else{
      //TODO : look in inventory
      [WQ print:@"Could not find a %@ in this room", key];
    }
  }else{
      [WQ print:@"Examine what?"];
  }
}

-(NSDictionary*)dictionaryForExamine {
  return [NSDictionary dictionary];
}

-(void)playerDidEnterRoom { }
-(BOOL)playerShouldEnterRoom { return YES; }

-(BOOL)playerShouldLeaveRoom { return YES;}
-(void)playerDidLeaveRoom { }

@end
