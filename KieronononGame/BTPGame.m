//
//  WibbleQuestGame.m
//  WibbleQuest
//
//  Created by orta therox on 10/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "BTPGame.h"

#import "StartingRoom.h"
#import "FinaleRoom.h"
#import "BodyGuard.h"
#import "Bubba.h"
#import "Keytar.h"
#import "GoatBoy.h"
#import "FloatstarPX.h"
#import "RockShop.h"

@implementation BTPGame
@synthesize wq;

-(NSString *) gameName{
  return @"Brutal Techno Punk On";
}

-(NSString *) gameDescription{
  return @"Kieronononon on is a game about getting to the show, and beating the man to it.";
}

-(void)ready {

#if RUN_KIF_TESTS
  [wq start];
  return;
#endif
  
  Player * player = [Player sharedPlayer];
  player.damageRange = NSMakeRange(1, 3);
  player.maxHealth = 10;
  player.health = 10;
  player.money=20;
  
  
  Room * openingRoom = [[StartingRoom alloc] init];
  openingRoom.id = @"spawn";
  openingRoom.name = @"Backstage, at the venue.";
  openingRoom.description = @"There are clothes all over the floor, and you can hear people practicing through the northern.";
  RockShop *rockShop = [[RockShop alloc] init];
  openingRoom.store = rockShop;
  
  Room * hallwayCenter = [[Room alloc] init];
  hallwayCenter.id = @"hallway";
  hallwayCenter.name = @"Hallway";
  hallwayCenter.description = @"The hallway is long and pretty boring, the music is louder out here, this hallway continues to the east. To the west there is a bathroom, and the Bar is to the east. On the bright side, the band's guitarist Goat Boy is infront of you. Why not say Hi?";
  [hallwayCenter connectSouth:openingRoom];

  Room * bathroom = [[Room alloc] init];
  bathroom.id = @"bathroom";
  bathroom.name = @"Bathroom";
  bathroom.description = @"Dingy bathroom, nothing particularly out of the ordinary, bits of terrible graffitti and the smell of sweat.";
  [bathroom connectEast:hallwayCenter];
  
  Room * bar = [[Room alloc] init];
  bar.name = @"Bar";
  bar.id = @"bar";
  bar.description = @"The wooden furnish on the bar really adds to the atmosphere. Anyway, to get on-stage you need to go south into the Alley. FloatstarPX is mulling around next to an empty glass waiting on something.";
  [bar connectWest:hallwayCenter];

  Room * alley = [[Room alloc] init];
  alley.name = @"Dark Alley";
  alley.id = @"alley";
  alley.description = @"The Alley is everything you heard it to be, dark, dingy and crrepy. ou can get back into the bar to the north, there's a guy who Float refered to as a bodyguard here. Looks like he's blocking the entrance to the south. You might have to fight to get past.";
  [alley connectNorth:bar];

  FinaleRoom * final = [[FinaleRoom alloc] init];
  final.name = @"On Stage";
  final.id = @"finale";
  final.description = @"You arrive on stage, kick the terrible band off stage and wave your keytar in the air like you actually know what you're doing. Congrats! You've completed the game :)";

  RockShop *shop = [[RockShop alloc] init];
  shop.description = @"1234 shop";
  openingRoom.store = shop;
  
  Bubba *b2 = [[Bubba alloc] init];
  b2.onInlineDrop = ^(){
    [WQ print:@"wow you dropped bubba!"];
  };
  
  [openingRoom addItem:b2];
  
  Keytar *keytar = [[Keytar alloc] init];
  [bathroom addItem:keytar];  
  
  GoatBoy *gb = [[GoatBoy alloc] init];
  [gb respondTo:@"slap goat" with:^{
    [WQ print:@"Slappped!"];
  }];
  
  hallwayCenter.person = gb;
  
  FloatstarPX * px = [[FloatstarPX alloc] init];
  bar.person = px;
  
  BodyGuard *joe = [[BodyGuard alloc] init];
  alley.encounter = joe;
  

  wq.currentRoom = openingRoom;

  [wq heading:@"Wibble Quest Example"];
  [wq wait:1];
  [wq print:@"You groggily wake up, the lights hurt your eyes as you adjust. There's a low grumble of bass which presumably is from someone's soundcheck and you remember that you arrived at the music venue a day early and slept over here."];

  [wq print:@"There's a knock on your door and a muffled shout saying 'oi, get up!'"];
  
  [wq start];
}

-(void)playerWasBeatenBy:(Creature *)creature {
  Player * player = [Player sharedPlayer];
  [wq print:@"Looks like you've ran out of ego. Perhaps you need to find something to help you in your fight against the %@", creature.name];
  creature.health = creature.maxHealth;
  player.health = player.maxHealth;
}


@end