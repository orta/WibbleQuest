//
//  BodyGuard.m
//  MyBoots
//
//  Created by orta therox on 16/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "BodyGuard.h"

@implementation BodyGuard

- (NSString *) name {
  return @"Body Guard";
}

-(int) maxHealth {
  return 10;
}

-(NSRange)damageRange {
  return NSMakeRange(2, 4);
}

-(int)damageTakenModifier:(int)originalDamage {
  // if the player has a keytar, then double the damage
  if([Player has:@"keytar"]){
    return originalDamage * 2;
  }
  return originalDamage;
}

-(NSArray*)formattedAttackPhrases{
  return [NSArray arrayWithObjects:
          @"The bodyguard looks at you grimly and causes %i ego damage.",
          @"The bodyguard shakes his head and bruising yourego by %i.",
          @"The bodyguard puts his earphone in and ignores you hurting your ego by %i.", nil];
}

-(NSArray*)formattedDefensePhrases{
  return [NSArray arrayWithObjects:
          @"You do a great impression of an air keytar impressing the bodyguard for %i ego boost",
          @"You scream, loudly, impressing the bodyguard by %i damage",
          @"You impress the bodyguard with your tattoos improving his opinion of you by %i.", nil];
}

@end
