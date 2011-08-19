//
//  Creature.m
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Creature.h"

@interface Creature()
-(void)takeDamage:(int)damage;
-(void)giveDamage:(int)damage;
@end

@implementation Creature

@synthesize  health, maxHealth, fighting, fightable, damageRange, turn;

-(id)init{
  self = [super init];
  self.fighting = NO;
  self.fightable = YES;
  self.damageRange = NSMakeRange(-1, -1);
  self.health = [self maxHealth];
  self.turn=0;
  return self;
}

-(NSArray*)creatureAttackPhrases {
  NSLog(@"No formatted attack phrases created for Creature %@", self.name);
  return [NSArray arrayWithObject:@"The creature attacks you for %i damage"];
}

-(NSArray*)playerAttackPhrases {
  NSLog(@"No formatted defense phrases created for Creature %@", self.name);
  return [NSArray arrayWithObject:@"You attack the creature for %i damage"];  
}

-(BOOL)randomAttackPhrase{
  //Return YES if you want a random attack phrase picked each turn
  return YES;
}

-(int)damageTakenModifier:(int)originalDamage {
  // do nothing normally
  return originalDamage;
}


-(void)fight {
  if (!fightable) {
    return;
  }
  
  Player * player = [Player sharedPlayer];
  if(self.fighting == NO){
    
    // called on the first fight only    
    [self beforeFight];
    NSString *battleStatus = [NSString stringWithFormat:@"Player %i / %i, %@ %i / %i.", player.health, player.maxHealth, self.name, self.health, self.maxHealth];
    [WQ command:battleStatus];
    self.fighting = YES; 
  }
  
  //player attack 
  if ( [player damageRange].location == -1 ) {
    [WQ print:@"damageRange not set on Player class"];
  }
  if ( [self damageRange].location == -1 ) {
    [WQ print:@"damageRange not set on Player class"];
  }
  
  // get the range between max/min with a of 1
  int range = [player damageRange].length - [player damageRange].location;
  range = MAX(range, 1);
  
  // apply damage from player
  int playerDamage = ( arc4random() % range ) + [player damageRange].location;
  playerDamage = [self damageTakenModifier:playerDamage];
  [self takeDamage:playerDamage];
  self.health -= playerDamage;
  
  // check damage done from player
  if(self.health < 1){
    self.fightable = NO;
    player.health = maxHealth;
    [self afterCreatureLost];
    return;
  }

  
  [self beforeTurn];
  // enemy health check
  int range2 = self.damageRange.length - self.damageRange.location;
  range2 = MAX(range2, 1);
  
  int creatureDamage = ( arc4random() % range2 ) + self.damageRange.location;
  [self giveDamage:creatureDamage];
  player.health -= creatureDamage;

  // player health check
  if(player.health < 1){
    [self afterCreatureWon];
    NSObject <WibbleQuestGameDelegate>* game = [[WibbleQuest sharedWibble] game];
    if([game respondsToSelector:@selector(playerWasBeatenBy:)]){
      [game playerWasBeatenBy:self];
    }
    return;
  }

  [self afterTurn];
  
  self.turn++;
  
  NSString *battleStatus = [NSString stringWithFormat:@"Player %i / %i, %@ %i / %i.", player.health, player.maxHealth, self.name, self.health, self.maxHealth];
  [WQ command:battleStatus];
}

-(void)takeDamage:(int)damage{
  int index;
  
  if([self randomAttackPhrase]){
    index = arc4random() % [self.playerAttackPhrases count];
  }
  else{
    //Loops back to the first phrase when the turn is greater then the count
    index = self.turn % [self.playerAttackPhrases count];
  }
  NSRange textRange = [[self.playerAttackPhrases objectAtIndex:index] rangeOfString:@"%i"];
  
  if(textRange.location != NSNotFound)
  {
    [WQ print:[self.playerAttackPhrases objectAtIndex:index], damage];
  }
  else{
    [WQ print:[self.playerAttackPhrases objectAtIndex:index]];
  }
}

-(void)giveDamage:(int)damage{
  int index;
  
  if([self randomAttackPhrase]){
    index = arc4random() % [self.creatureAttackPhrases count];
  }
  else{
    //Loops back to the first phrase when the turn is greater then the count
    index = self.turn % [self.creatureAttackPhrases count];
  }  
  NSRange textRange =[[self.creatureAttackPhrases objectAtIndex:index] rangeOfString:@"%i"];
  
  if(textRange.location != NSNotFound)
  {
    [WQ print:[self.creatureAttackPhrases objectAtIndex:index], damage];
  }
  else{
    [WQ print:[self.creatureAttackPhrases objectAtIndex:index]];
  }
}



-(void)beforeTurn{};
-(void)afterTurn{};
-(void)beforeFight{};

-(void)afterCreatureLost{};
-(void)afterCreatureWon{};

@end
