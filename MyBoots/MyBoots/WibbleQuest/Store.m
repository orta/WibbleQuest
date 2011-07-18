//
//  Store.m
//  MyBoots
//
//  Created by pH on 7/17/11.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Store.h"

@implementation Store
@synthesize items;

-(void)beforeTrading{}
-(void)afterTrading{}

-(void)buyItem:(NSArray*)conditions{
  
  NSString *itemName = [conditions second];
  if([self.items objectForKey:itemName] == nil) {
    [WQ print:@"We don't sell %@ here", itemName];
    return;
  }
  
  int cost = [[self.items objectForKey:itemName] intValue];
  Player *player = [Player sharedPlayer];
  if ( player.money < cost ){
    [WQ print:@"You do not have enough money"];
    return;
  }
  player.money -= cost;
  
  Item *playerItem = [[NSClassFromString([itemName capitalizedString]) alloc] init];
  if(playerItem == nil){
    [WQ print:@"The item %@ cannot be found (Maybe you forgot to import or spelled it wrong).", itemName];
    return;
  }
  [[WibbleQuest sharedWibble].inventory addItem:playerItem];
  
  
}
@end
