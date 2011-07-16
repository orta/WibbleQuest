//
//  BodyGuard.m
//  MyBoots
//
//  Created by orta therox on 16/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "BodyGuard.h"

@implementation BodyGuard

// arrive in room
// make any command
// attack
// defend

-(NSRange)damageRange {
  return NSMakeRange(0, 1);
}

-(NSArray*)formattedAttackPhrases{
  return [NSArray arrayWithObjects:
          @"The bodyguard looks at you grimly and causes %i damage",
          @"The bodyguard shakes his head and causes %i damage",
          @"The bodyguard puts his earphone in and ignores you hurting your ego by %i.", nil];
}

@end
