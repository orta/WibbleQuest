//
//  PlayerInventory.m
//  MyBoots
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "PlayerInventory.h"

@implementation PlayerInventory
@synthesize items;

-(void)addItem:(Item*) item {
  if(items == nil){
    items = [NSMutableArray arrayWithObject:item];
  }else{
    [items addObject:item];
  }
}

-(void)describeInventory {
  if(items == nil){
    [WQ print:@"You have no items"];
  }else{
    for (Item * item in items) {
      [WQ print:[NSString stringWithFormat:@": %@", item.description ]];
    }
  }
  
}
@end
