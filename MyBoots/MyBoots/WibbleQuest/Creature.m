//
//  Creature.m
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Creature.h"
#import "Player.h"

@implementation Creature

  @synthesize  health, maxHealth, minDamage, maxDamage, name, description, fighting;

-(id)init{
  self = [super init];
  NSArray *phrases = [[self formattedAttackPhrases] arrayByAddingObjectsFromArray:[self formattedDefensePhrases]];
  for (NSString * phrase in phrases) {
    if ([phrase rangeOfString:@"%i"].location == NSNotFound ) {
      NSLog(@"Did not find a percent i in the phrase: '%@' this may cause a crash.", phrase);
    }
  }
  return self;
}

-(NSRange)damageRange {
  NSLog(@"No damage range created for Creature %@", name);
  return NSMakeRange(0, 1);
}

-(NSArray*)formattedAttackPhrases{
  NSLog(@"No formatted attack phrases created for Creature %@", name);
  return [NSArray arrayWithObject:@"The creature attacks you for %i damage"];
}

-(NSArray*)formattedDefensePhrases{
  NSLog(@"No formatted defense phrases created for Creature %@", name);
  return [NSArray arrayWithObject:@"You attack the creature for %i damage"];  
}

-(void)fight {
  Player * player = [Player sharedPlayer];
  if(self.fighting == NO) [self beforeFight];
  //PLAYER ATTACK 
  if(self.health < 1){
    [self afterFightLost];
  }
  [self beforeTurn];
  //CREATURE ATTACK
  [self afterTurn];
  if(player.health < 1){
    [self afterFightLost];
    NSObject <WibbleQuestGameDelegate>* game = [[WibbleQuest sharedWibble] game];
    if([game respondsToSelector:@selector(playerWasBeatenBy:)]){
      [game playerWasBeatenBy:self];
    }
      
  }

}


-(void)beforeTurn{};
-(void)afterTurn{};

-(void)beforeFight{};
-(void)afterFightLost{};
-(void)afterFightWon{};

@end
