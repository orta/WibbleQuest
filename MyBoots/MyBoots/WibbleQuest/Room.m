//
//  Room.m
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Room.h"

@implementation Room

@synthesize  name, description, id, north, east, west, south, items = _items, encounter;

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

@end