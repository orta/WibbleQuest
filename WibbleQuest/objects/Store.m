//
//  Store.m
//  WibbleQuest
//
//  Created by pH on 7/17/11.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Store.h"

@implementation Store
@synthesize items;

-(id) init{
  self = [super init];
  self.items = [NSMutableArray array];
  return self;
}

-(void)beforeTrading{}
-(void)afterTrading{}

// third time this has been rewrote,
// I think that by defining the class we ensure that 
// someone doesn't accidentally put the wrong string in.
-(void)addItemOfClass:(Class)class withValue:(int) value {
  [self.items addObject:class];
  [self.items addObject:[NSNumber numberWithInt:value]];
}

-(void)showStoreInventory {
  [WQ print:@"%@", self.description];
  for (int i = 0; i < [self.items count] ; i += 2) {
    [WQ print:@"%@ - £%@", NSStringFromClass([self.items objectAtIndex:i]), [self.items objectAtIndex: i+1 ]];    
  }
}

-(void) buyItem:(NSArray*)conditions{  
  NSString *itemName = [conditions second];
  Player *player = [Player sharedPlayer];

  bool found;
  for (int i = 0; i < [self.items count] ; i += 2) {
    Class ItemClass = [self.items objectAtIndex:i];
    if ([[itemName lowercaseString] isEqualToString:[(NSString*) NSStringFromClass(ItemClass) lowercaseString]]) {
      // found the class
      int cost = [[self.items objectAtIndex:i+1] intValue];
      if ( player.money < cost ){
        [WQ print:@"You do not have enough money"];
        return;
      }
      Item * item;
      @try {
        item = [[ItemClass alloc] init];
      }
      @catch (NSException *exception) {
        NSLog(@"something went wrong with creating a copy of the class %@ - are you sure it's a subclass of Item?", itemName);
      }
      
      [Inventory addItem:item];
      player.money -= cost;
      found = YES;
    }
  }  
  if( found == NO ){
    if (itemName) {
      [WQ print:@"We don't sell %@'s here", itemName];
    }else{
      [WQ print:@"Buy what?"];
    }
    return;
  }
}
@end
