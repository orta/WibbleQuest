//
//  KidA.m
//  Megatron
//
//  Created by orta therox on 26/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "KidA.h"
// Craig
@implementation KidA
@synthesize faked, talked,caught;

-(void)playerEntersSameRoom {
  if (!talked) {
    [WQ say:@"Kid" words:@"Argh!"];
    [WQ print:@"The kid looks shocked."];
    talked = YES;
  }
}

-(BOOL)didRespondToCommand:(NSArray*)commandArray {
  NSString * command = [commandArray first];
  if ([@"ignore" isEqualToString:command]) {
    [self gotKid];
    return YES;
  }
  return NO;
}


-(void)respondToSentenceArray:(NSArray*)sentence {

  if([sentence contains:@"hello", @"hi", @"omg", nil] ){
    [WQ print:@"The kid doesn't do anything, maybe you should tell him to get out."];
    return; 
  }
  
  if([sentence contains:@"out", @"get", @"away", nil] && !self.faked  ){
    [WQ say:@"Kid" words:@"Arrgghhh"];
    [WQ print:@"The kid falls to the floor onto this back"];
    [WQ wait: 3];
    [WQ say:@"Kid" words:@"I need insulin. I'm diabetic."];
    [WQ wait: 2];
    [WQ command:@"You think to yourself that you have a medkit back in the office"];
    self.description = @"There is a kid lying on the floor, and you can go north to orta's room.";
    self.faked = YES;
    return;
  }
  
  if([sentence contains:@"insulin", @"diabetic", @"needles", @"injection",  nil] ){
    [WQ say:@"Kid" words:@"Yeah, I need insulin."];
    return;
  }  
  
  if([sentence contains:@"no", @"fake", @"liar", @"dont", @"don't", @"shut", @"catch", @"caught", nil] ){
    [self gotKid];
    return;
  }  
}

-(void) gotKid {
  self.caught = YES;
  self.faked = NO;

  [WQ say:@"Kid" words:@"Eek. Argh you got me!"];
  [WQ print:@"You grab the kid by the collar and chuck him up from under the table"];
  [WQ print:@"You read his name tag, Craig Sussen. Noted."];  
  [WQ command:@"Consider Craig dragged along by the scruff of his neck from now on."];
  Player *p = [Player sharedPlayer];
  p.money++;

}

@end
