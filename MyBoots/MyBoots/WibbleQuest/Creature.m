//
//  Creature.m
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Creature.h"

@implementation Creature

  @synthesize  health, maxHealth, minDamage, maxDamage, name, description;

-(id)init{
  self = [super init];
  for (NSString * phrase in [self formattedAttackPhrases]) {
    if ([phrase rangeOfString:@"%i"].location == NSNotFound ) {
      NSLog(@"Did not find a percent i in the attack phrase: '%@' this may cause a crash.", phrase);
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

-(void)beforeTurn{};
-(void)afterTurn{};

-(void)beforeFight{};
-(void)afterFight{};

@end
