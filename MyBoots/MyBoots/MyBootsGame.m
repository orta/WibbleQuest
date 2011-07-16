//
//  MyBootsGame.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "MyBootsGame.h"

#import "BodyGuard.h"
#import "Bubba.h"
#import "Doc.h"

@implementation MyBootsGame
@synthesize wq;

-(NSString *) gameName{
  return @"Brutal Techno Punk On";
}

-(NSString *) gameDescription{
  return @"Kieronononon on is a game about getting to the show, and beating the man to it.";
}

-(void)ready {
  
  Room * openingRoom = [[Room alloc] init];
  openingRoom.name = @"Backstage, at the venue.";
  openingRoom.description = @"There are clothes all over the floor, and you can hear people practicing through the southern door.";
  
  Room * hallwayCenter = [[Room alloc] init];
  hallwayCenter.name = @"Hallway";
  hallwayCenter.description = @"The hallway is long and pretty boring, the music is louder out here, this hallway continues to the east. The door to your room is to the north";
  [hallwayCenter connectNorth:openingRoom];

  Room * hallwayEast = [[Room alloc] init];
  hallwayEast.name = @"Hallway East";
  hallwayEast.description = @"The music is loud, you see some empty red cups. Perhaps the pop and crisp night is on. You realize that sound you hear is Justin Beiber, and it's coming from the South. Doc is here, he looks worried. Why not say Hi?";
  [hallwayEast connectWest:hallwayCenter];
  hallwayEast.person = [[Doc alloc] init];

  
  Bubba *b2 = [[Bubba alloc] init] ;  
  [openingRoom addItem:b2];
  
  BodyGuard *joe = [[BodyGuard alloc] init];
  openingRoom.encounter = joe;
  
  [wq addRoom:openingRoom];
  [wq addRoom:hallwayCenter];
  [wq addRoom:hallwayEast];

  wq.currentRoom = openingRoom;
  
  [wq heading:@"Wibble Quest Example"];
  [wq print:@"You groggily wake up, the lights hurt your eyes as you adjust. There's a lot of bass which presumably is from someone's soundcheck and you remember that you arrived at the music venue a day early and slept over here."];

  [wq print:@"There's a knock on your door and a muffled shout saying 'oi, get up!'"];
  
  [wq start];

}

@end