//
//  MyBootsGame.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "MyGame.h"

@implementation MyGame
@synthesize wq;

-(NSString *) gameName{
  return @"Wavy Hanz Man";
}

-(NSString *) gameDescription{
  return @"Walk around through the eye's of mr Wavy Hanz";
}

-(void)ready {  
  Room * openingRoom = [[Room alloc] init];
  openingRoom.name = @"Strange Castle.";
  openingRoom.description = @"There is a an exit to the north, it looks like it might take you outisde into the courtyard of this odd castle.";
  
  Room * courtyard = [[Room alloc] init];
  courtyard.name = @"Hallway";
  courtyard.description = @"From the outside you see the castle is massive, what else could there be here?";
  [courtyard connectSouth:openingRoom];
  
  [wq addRoom:openingRoom];
  [wq addRoom:courtyard];
  
  wq.currentRoom = openingRoom;
  
  [wq start];
}

@end