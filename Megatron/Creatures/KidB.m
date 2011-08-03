//
//  KidB.m
//  Megatron
//
//  Created by orta therox on 28/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "KidB.h"

@implementation KidB


- (NSString *) name {
  return @"Kid";
}

-(int) maxHealth {
  return 12;
}

-(NSRange)damageRange {
  return NSMakeRange(3, 4);
}

-(int)damageTakenModifier:(int)originalDamage {
  // if the player has a keytar, then double the damage
  if([Player has:@"sword"]){
    return originalDamage * 3;
  }
  return originalDamage;
}

-(void)playerEntersSameRoom {
    [WQ say:@"Kid" words:@"I challenge you to a duel!"];
}


-(void)beforeFight {
  [WQ print:@"The kid pulls back sword in hand and gets themselves into a defensive position."];
  [WQ wait:3];
}


-(void)afterCreatureLost{
  [WQ print:@"You do a swipe that makes the papers on the tables fly around the room, and the kid is knocked back off his feet. And is just in pure awe."];
  [WQ say:@"Kid" words:@"Wow, that was a fight and a half. "];
  [WQ print:@"You get the kid and put him in your inventory"];
  [Player sharedPlayer].money += 1;
  Room* prog = [WQ getRoomByID:@"prog1"];
  prog.description = @"The room has paper scattered all over the floor. You can go east from here to get back to your office.";
}

-(void)afterCreatureWon{

  
  [WQ print:@"The kid knocks you to the floor, and takes the oppertunity to run out and past you."];
  [WQ say:@"Kid" words:@"Byyyyeeeee......"];
  [[WibbleQuest sharedWibble].game performSelector:@selector(directorCall) withObject:nil afterDelay:30.0f];
  [WQ print:@"You get back up to your feet."];
  WibbleQuest * wq = [WibbleQuest sharedWibble];
  [wq describeSurroundings];
};

-(BOOL)randomAttackPhrase{
  return YES;
}
-(NSArray*)formattedAttackPhrases{
  return [NSArray arrayWithObjects:
          @"The kid deflects what you thought was a good blow and gives you a good whack on the side of the arm doing %i damage.",
          @"The kid dives at you, you attempt to deflect his swipe but it doesn't work, you take %i damage.",
          @"The kid swings, he hits. Ouch! %i damage.",
          nil];
}

-(NSArray*)formattedDefensePhrases{
  if ([Player has:@"sword"]) {
    return [NSArray arrayWithObjects:
            @"You jab forwards, and knock the kids sword out of the way, then with a lunge you swing in horizontally and give him a good shot to the ribs doing %i damage",
            @"You slice the air, and await his return shot. On the return you knock him off-balance leaving his back exposed for a clean jab doing %i damage.",
            @"The kid lunges at you, and you knock the blow out of the way, with a quick flick of the wrist you bonk him on the head with the flat of your sword, doing %i damage.", nil];
  }
  return [NSArray arrayWithObjects:
          @"You don't have much to fight him with, so you try throwing a keyboard at he kid, but he deflects it easily, causing %i damage",
          @"Without a sword you try move in to grab the kid, but he slaps you on the side causing %i damage", nil];
}

-(void)respondToSentenceArray:(NSArray*)sentence {
  if([sentence contains:@"hi", @"hello", nil] ){
    [WQ say:@"Kid" words:@"Megatron, I'm not going out till you've beaten me in foam sword combat."];
    [WQ say:@"Megatron" words:@"No, get out."];
    [WQ wait:3];
    [WQ print:@"The kid looks unconvinced"];
    return;
  }
  if([sentence contains:@"sword", @"foam", @"fight", nil] ){
    [WQ say:@"Kid" words:@". . ."];
    [WQ print:@"The Kid looks like they want to fight, maybe you should stop talking about it and get to some action"];
    return;
  }
  
  [WQ say:@"Kid" words:@". . ."]; 
}

@end
