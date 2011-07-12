//
//  Room.m
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Room.h"

@implementation Room

@synthesize  name, description, id, north, east, west, south, items, encounter;

-(id)init{
  self = [super init];
  items = [NSMutableArray array];
  return self;
}

-(void)addItem:(Item*) item {
  if(items == nil){
    items = [NSMutableArray arrayWithObject:item];
  }else{
    [items addObject:item];
  }
}

-(void)describeInventory {
  NSLog(@"HI");

  
  
    for ( NSObject *item in self.items) {
//      NSLog(@"item %i", [items count]);

//    [WQ print:[NSString stringWithFormat:@": %@", item.descriptionInRoom ]];
    }
}

@end