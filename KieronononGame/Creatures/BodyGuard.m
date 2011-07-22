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

-(void)beforeFight {
  [WQ print:@"You tell the bodyguard that you need to get onstage."];
  [WQ wait:1];
  [WQ print:@"He ignores you."];
  [WQ wait:1];
  [WQ print:@"Still ignoring you"];
  [WQ wait:2];
  [WQ print:@"You start to try push past him, but he simply clenches his fists like he means business. Guess you're gonna have to go Brutal Techno Punk on him."];
}


-(void)afterFightLost{
  Room* outside = [WQ getRoomByID:@"alley"];
  Room* finale = [WQ getRoomByID:@"finale"];

  [outside connectWest:finale];
  outside.description = @"The alley seems a lot lighter since the bodyguard went away, you can go north back into the bar, or west to the main stage";
  
  [WQ print:@"With a bow to your skill the Body Guard stands out of the way and you can now west onto the stage."];
};


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

-(void)respondToSentenceArray:(NSArray*)sentence {
  if([sentence contains:@"hi", @"hello", nil] ){
    [WQ say:@"Bodyguard" words:@"Who're you"];
    return;
  }
  if([sentence contains:@"orta", nil] ){
    [WQ say:@"Bodyguard" words:@"Never heard of you."];
    return;
  }
  
  [WQ say:@"Bodyguard" words:@". . ."]; 
}


@end
