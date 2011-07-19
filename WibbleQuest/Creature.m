//
//  Creature.m
//  MyBoots
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

  @synthesize  health, maxHealth, fighting, fightable, damageRange;

-(id)init{
  self = [super init];
  self.fighting = NO;
  self.fightable = YES;
  self.damageRange = NSMakeRange(0, 1);
  self.health = [self maxHealth];
  
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
  int range = [player damageRange].length - [player damageRange].location;
  int damage = ( arc4random() % range ) + [player damageRange].location;
  damage = [self damageTakenModifier:damage];
  [self takeDamage:damage];
  self.health -= damage;
  
  //enemy health check
  if(self.health < 1){
    self.fightable = NO;
    player.health = maxHealth;
    [self afterFightLost];
    return;
  }
  
  [self beforeTurn];
  //enemy health check
  int range2 = player.damageRange.length - player.damageRange.location;
  int damage2 = ( arc4random() % range2 ) + player.damageRange.location;
  [self giveDamage:damage2];
  player.health -= damage2;
  
  [self afterTurn];
  if(player.health < 1){
    [self afterFightLost];
    NSObject <WibbleQuestGameDelegate>* game = [[WibbleQuest sharedWibble] game];
    if([game respondsToSelector:@selector(playerWasBeatenBy:)]){
      [game playerWasBeatenBy:self];
    }
  }
}

-(void)takeDamage:(int)damage{
  int index = arc4random() % [self.formattedAttackPhrases count];
  [WQ print:[self.formattedAttackPhrases objectAtIndex:index], damage];
}

-(void)giveDamage:(int)damage{
  int index = arc4random() % [self.formattedDefensePhrases count];
  [WQ print:[self.formattedDefensePhrases objectAtIndex:index], damage];
}



-(void)beforeTurn{};
-(void)afterTurn{};

-(void)beforeFight{};
-(void)afterFightLost{};
-(void)afterFightWon{};

-(void)respondToSentenceArray:(NSArray*)sentence{}


@end
