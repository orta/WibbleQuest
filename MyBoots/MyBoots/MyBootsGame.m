//
//  MyBootsGame.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "MyBootsGame.h"

@implementation MyBootsGame
@synthesize wq;

-(void)awakeFromNib {
  // when we are ready
  Room * openingRoom = [[Room alloc] init];
  openingRoom.name = @"Priceton Dorms";
  openingRoom.description = @"There are clothes all over the floor, and you can hear the feint sounds of music from down the hallway";
  [wq addRoom:openingRoom];
  wq.currentRoom = openingRoom;
  
}

@end
