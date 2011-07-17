//
//  Room.m
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Room.h"

@implementation Room

@synthesize  name, description, id, north, east, west, south, items = _items, encounter, person, visited;

-(id)init{
  self = [super init];
  self.items = [NSArray array];
  return self;
}

-(void)addItem:(Item*) item {
  [item retain];
  self.items = [self.items arrayByAddingObject: item];
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

      self.items = tempItems;
      [item release];
      return item;
    }
  }  
  return nil;
}

- (void) connectNorth:(Room*)room{
  self.north = room;
  room.south = self;
}

- (void) connectSouth:(Room*)room{
  self.south = room;
  room.north = self;
}

- (void) connectWest:(Room*)room{
  self.west = room;
  room.east = self;  
}

- (void) connectEast:(Room*)room{
  self.east = room;
  room.west = self;
}

-(void)examineWithInput:(NSString*)input{
  NSArray * commands = [input componentsSeparatedByString:@" "];
  if ([commands count] > 1) {
    NSString * key = [commands objectAtIndex:1];    
    NSString * itemDescription = [[self dictionaryForExamine] objectForKey:key];
    if (itemDescription != nil) {
      [WQ print:@"%@", itemDescription];  
    }else{
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