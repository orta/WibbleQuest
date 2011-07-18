//
//  Store.m
//  MyBoots
//
//  Created by pH on 7/17/11.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Store.h"


@implementation Store

-(NSString*)description{
  return @"A shop";
}

-(void)beforeTrading{}
-(void)afterTrading{}

-(NSDictionary*)shopItems{return nil;}

-(void)buyItem:(NSArray*)conditions{
  
  NSString *itemName = [conditions objectAtIndex:1];
  if([[self shopItems] objectForKey:itemName] == nil) {
    [WQ print:[NSString stringWithFormat:@"We don't sell %@ here",[conditions objectAtIndex:1]]];
    return;
  }
  
  int cost = [[[self shopItems] objectForKey:itemName] intValue];
  Player *player = [Player sharedPlayer];
  if ( player.money < cost ){
    [WQ print:@"You do not have enough money"];
    return;
  }
  player.money -= cost;
  
  Item *playerItem = [[NSClassFromString([itemName capitalizedString]) alloc] init];
  if(playerItem==nil){
    [WQ print:[NSString stringWithFormat:@"The item %@ cannot be found(Forgot to import or spelled it wrong). I am talking to you Mr./Mrs. Developer",itemName]];
    return;
  }
  [[WibbleQuest sharedWibble].inventory addItem:playerItem];
  
  
}
@end
