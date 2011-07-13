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

-(BOOL) respondsToCommand:(NSString*) command {
  for (Item * item in self.items) {
    [item respondsToCommand:command];
  }
  return NO;
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
