//
//  MyBootsGame.m
//  MyBoots
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "MegatronGame.h"
#import "Bubba.h"
#import "OpeningRoom.h"
#import "OrtasRoom.h"
#import "Snake.h"
#import "Flag.h"
#import "KidA.h"
#import "KidB.h"
#import "SnakesRoom.h"
#import "FoamSword.h"
#import "ExitRoom.h"

@implementation MegatronGame
@synthesize wq;

-(NSString *) gameName{  
  return @"The Megatron Marches";
}

-(NSString *) gameDescription{
  return @"The kids are escaping, you've gotta catch them before you get enough calls from camper parents that you lose your job. (ps type help if you don't know what to do )";
}

-(NSString *)devString{
  return @"";
}

-(void)directorCall {
  [WQ heading:@"You get a call"];
  [WQ wait:3];
  [WQ title:@"It's a parent, one of the kids escaped. The kid is forced to apolagise to you for lying about the diabetes. If it happens again you should call him out on it."];
  [WQ wait:4];
  [WQ print:@"You hesitantly pick up the phone."];  
  [WQ wait:3];
  [WQ print:@"Uh Oh. Reestart time."];
  [WQ wait: 10];
  
  [wq restart];
}

-(void)ready {  
  Player * player = [Player sharedPlayer];
  player.money = 0;
  player.health = 10;
  player.maxHealth = 10;
  player.damageRange = NSMakeRange(2, 3);
  
  OpeningRoom * openingRoom = [[OpeningRoom alloc] init];
  openingRoom.name = @"The MD's office";
  openingRoom.description = @"Your office, you keep a bunch of paperwork in there. You can get to the programming room by going west, or to orta's room by going to the south.";
  openingRoom.id = @"office";
  openingRoom.person = [[Snake alloc] init];
  
  Room * programmingRoom = [[Room alloc] init];
  programmingRoom.name = @"The Programming Room";
  programmingRoom.description = @"You're in the yava and C++ programming room, the tables are cluttered with stuff and you see a kid in the center of the room wearing some space armour and wieling a foam sword, you can get back to your office by going east or go south to Nyans room.";
  programmingRoom.id = @"prog1";
  programmingRoom.encounter = [[KidB alloc] init];
  [programmingRoom addItem:[[FoamSword alloc] init] ];
  
  OrtasRoom * ortasRoom = [[OrtasRoom alloc ] init];
  ortasRoom.id = @"prog2";
  ortasRoom.name = @"orta's room";
  ortasRoom.description = @"It's a pretty messy room, you can tell orta gets a little too comfy here sometimes but whatever, there's a bunch of Macs here some are still on. To the north you can go back to your office, to the south is Snake's room.";
  [ortasRoom addItem:[[Bubba alloc] init]];
  
  [openingRoom connectWest:programmingRoom];
  [openingRoom connectSouth:ortasRoom];
  
  SnakesRoom * snakesRoom = [[SnakesRoom alloc] init];
  snakesRoom.id = @"video";
  snakesRoom.name = @"Snake's room";
  snakesRoom.description = @"This room is covered in American flags, you didnt know Snake was so patriotic. From here you can go north to orta's room, or west to the front exit.";
  [snakesRoom addItem: [[Flag alloc] init]];
  [snakesRoom connectNorth:ortasRoom];
  snakesRoom.person = [[KidA alloc] init];
  
  ExitRoom * exitRoom = [[ExitRoom alloc] init];
  exitRoom.id= @"exit";
  exitRoom.name = @"Front Exit";
  exitRoom.description = @"The front exit lets you go out to Wawa, but you don't see any kids here, guess if they were here they'd gone already, you can go east to Snakes room, or North to Nyans room";
  [exitRoom connectEast:snakesRoom];
  
  Room  * nyansRoom = [[Room alloc] init];
  nyansRoom.id = @"nyan";
  nyansRoom.name = @"Nyan Cat's room";
  nyansRoom.description = @"Nyan's room has posters all over the wall, meme's everywhere. There's a computer with a Nyan cat playing, luckily someone turned the speakers off. That'd get annoying quickly. You can go south to the front exit, and north to the programming room.";
  [nyansRoom connectNorth:programmingRoom];
  [nyansRoom connectSouth:exitRoom];
  
  wq.currentRoom = openingRoom;
  wq.tickerInterval=1.0f;
  NSLog(@"OK");
  [wq start];
}

@end