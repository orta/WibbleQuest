//
//  PlayerInventory.m
//  WibbleQuest
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "PlayerInventory.h"

@implementation PlayerInventory
@synthesize items = _items;

-(id)init{
  self = [super init];
  self.items = [NSArray array];  
  return self;
}

-(BOOL) didRespondToCommand:(NSArray*) commands {
  if ( [commands count] > 1 && [self hasItem: [commands second]] ) {
    Item *item = [self getItem:[commands second]];
    return [item didRespondToCommand:commands];
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
  self.items = [self.items arrayByAddingObject:item];
  [item onPickup];
}

-(void)removeItemByID:(NSString*) itemID {
  [self removeItem:[self getItem:itemID]];
}

-(void)removeItem:(Item*) item {
  NSMutableArray * temp = [self.items mutableCopy];
  [temp removeObject:item];
  self.items = temp;
}

-(void)describeInventory {
  if([self.items count] == 0){
    [WQ print:@"You have no items"];
  }else{
    [WQ print:@"Inventory"];
    
    for (int i = 0; i < [self.items count]; i++) {
      Item* item = [self.items objectAtIndex:i];
      if(item.description!=nil){
        [WQ print: [NSString stringWithFormat:@"- %@", item.description ]];
      }
    }
  }
}
@end
