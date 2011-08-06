//
//  Creature.m
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Creature.h"
#import "Player.h"

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
  NSArray *phrases = [[self formattedAttackPhrases] arrayByAddingObjectsFromArray:[self formattedDefensePhrases]];
  for (NSString * phrase in phrases) {
    if ([phrase rangeOfString:@"%i"].location == NSNotFound ) {
      NSLog(@"Did not find a percent i in the phrase: '%@' this may cause a crash.", phrase);
    }
  }
  return self;
}

-(NSArray*)formattedAttackPhrases {
  NSLog(@"No formatted attack phrases created for Creature %@", self.name);
  return [NSArray arrayWithObject:@"The creature attacks you for %i damage"];
}

-(NSArray*)formattedDefensePhrases {
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
  NSString *battleStatus = [NSString stringWithFormat:@"Player %i / %i, %@ %i / %i.", player.health, player.maxHealth, self.name, self.health, self.maxHealth];
  [WQ command:battleStatus];
  
  if(self.fighting == NO){
    [self beforeFight];
    self.fighting = YES; 
  }
  //player attack 
  if ( [player damageRange].location == -1 ) {
    [WQ print:@"damageRange not set on Player class"];
  }
  if ( [self damageRange].location == -1 ) {
    [WQ print:@"damageRange not set on Player class"];
  }

  
  int range = [player damageRange].length - [player damageRange].location;
  range = MAX(range, 1);

  int damage = ( arc4random() % range ) + [player damageRange].location;
  damage = [self damageTakenModifier:damage];
  [self takeDamage:damage];
  self.health -= damage;
  
  //enemy health check
  if(self.health < 1){
    self.fightable = NO;
    player.health = maxHealth;
    [self afterCreatureLost];
    return;
  }
  
  [self beforeTurn];
  //enemy health check
  int range2 = self.damageRange.length - self.damageRange.location;
  range2 = MAX(range2, 1);
  
  int damage2 = ( arc4random() % range2 ) + self.damageRange.location;
  [self giveDamage:damage2];
  player.health -= damage2;
  
  [self afterTurn];
  self.turn++;
  if(player.health < 1){
    [self afterCreatureWon];
    NSObject <WibbleQuestGameDelegate>* game = [[WibbleQuest sharedWibble] game];
    if([game respondsToSelector:@selector(playerWasBeatenBy:)]){
      [game playerWasBeatenBy:self];
    }
    return;
  }
}

-(void)takeDamage:(int)damage{
  int index;
  if([self randomAttackPhrase]){
    index = arc4random() % [self.formattedAttackPhrases count];
  }
  else{
    //Loops back to the first phrase when the turn is greater then the count
    index = self.turn % [self.formattedAttackPhrases count];
  }
  [WQ print:[self.formattedAttackPhrases objectAtIndex:index], damage];
}

-(void)giveDamage:(int)damage{
  int index;
  if([self randomAttackPhrase]){
    index = arc4random() % [self.formattedDefensePhrases count];
  }
  else{
    //Loops back to the first phrase when the turn is greater then the count
    index = self.turn % [self.formattedDefensePhrases count];
  }  
  if([self.formattedDefensePhrases contains:@"%i", nil]){
    [WQ print:[self.formattedDefensePhrases objectAtIndex:index], damage];
  }
  else{
    [WQ print:[self.formattedDefensePhrases objectAtIndex:index]];
  }
}



-(void)beforeTurn{};
-(void)afterTurn{};
-(void)beforeFight{};

-(void)afterCreatureLost{};
-(void)afterCreatureWon{};


-(void)respondToSentenceArray:(NSArray*)sentence{}

@end
