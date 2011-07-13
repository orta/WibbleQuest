//
//  MyBootsGame.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "MyBootsGame.h"
#import "Bubba.h"

@implementation MyBootsGame
@synthesize wq;

-(NSString *) gameName{
  return @"My Boots";
}

-(NSString *) gameDescription{
  return @"My boots is a game about finding your lost boots in a strange dorm room.";
}

-(void)ready {
  Room * openingRoom = [[Room alloc] init];
  openingRoom.name = @"Priceton Dorms";
  openingRoom.description = @"There are clothes all over the floor, and you can hear the faint sounds of music from down the hallway, there is a door to the hallway to the south.";
  
  Room * hallwayCenter = [[Room alloc] init];
  hallwayCenter.name = @"Hallway";
  hallwayCenter.description = @"The hallway is long and pretty boring, the music is louder out here, this hallway continues to the east and the west. The door to your room is to the north";
  [hallwayCenter connectNorth:openingRoom];

  Room * hallwayEast = [[Room alloc] init];
  hallwayEast.name = @"Hallway East";
  hallwayEast.description = @"The music is loud, you see some empty red cups. Perhaps the pop and crisp night is on. You realize that sound you hear is Justin Beiber";
  [hallwayEast connectWest:hallwayCenter];
  
  Bubba *b2 = [[Bubba alloc] init] ;  
  [openingRoom addItem:b2];

  [wq addRoom:openingRoom];
  [wq addRoom:hallwayCenter];
  [wq addRoom:hallwayEast];

  wq.currentRoom = openingRoom;
  
  [wq start];
}

@end