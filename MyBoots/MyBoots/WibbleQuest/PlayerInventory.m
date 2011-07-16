//
//  PlayerInventory.m
//  MyBoots
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "PlayerInventory.h"

@implementation PlayerInventory
@synthesize items = _items;

-(id)init{
  self = [super init];
  self.items = [NSArray array];  
  return self;
}

-(BOOL) respondToCommand:(NSArray*) commands {
  NSString * command = [commands componentsJoinedByString:@" "];
  for (Item * item in self.items) {
    if([[item commands] contains: command, nil]){
      [item command: commands];
      return YES;
    }
  }
  return NO;
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


-(void)addItem:(Item*) item {
  [item retain];
  self.items = [self.items arrayByAddingObject: item];
}

-(void)describeInventory {
  if([self.items count] == 0){
    [WQ print:@"You have no items"];
  }else{
    for (int i = 0; i < [self.items count]; i++) {
      Item* item = [self.items objectAtIndex:i];
      [WQ print:[NSString stringWithFormat:@": %@", item.description ]];
    }
  }
}
@end
