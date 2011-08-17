//
//  Snake.m
//  Megatron
//
//  Created by orta therox on 26/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Snake.h"

@implementation Snake

@synthesize allowsExit;

-(void)playerEntersSameRoom {
  if(!saidHi){
    [WQ say:@"Snake" words:@"Mega Director! there's a massive problem!"];
    saidHi = YES;
  }
}

-(void)respondToSentenceArray:(NSArray*)sentence {
  if(self.allowsExit) return;
  
  if (!replied) {
    [WQ say:@"Snake" words:@"We were taking some of the kids out into the fields for some good game of kickball but then we had some run off ARGH! CAN YOU HELP ME!? Can you find them, this is fruuuuuuustraiiiinggggg!!!"];
    replied = YES;
    return;
  }

  
  if([sentence contains:@"kids", nil] ){
    [WQ say:@"Snake" words:@"I don't know where the kids are, would I be here asking you Mega Director if I knew?"];
    return;
  }
  
  if([sentence contains:@"no", @"nope", @"nah", nil] ){
    //TODO random say
    [WQ say:@"Snake" words:@"NO!? who are you? you're not the MD I voted into power here! Come on, are you going to help me or what?"];
    return;
  }
  
  if([sentence contains:@"yes", @"yep", @"sure", @"ok", nil] ){
    [WQ say:@"Snake" words:@"OK! I'm gonna go sing hey ho bo diddly bop outside and see if that get's their attention, in the mean time there are 2 still that weren't in our count up. I can't remember their names though, so you should get them and bring them to the front exit."];
    [WQ print:@"Snake gets out of your doorway leaving the entrances to orta's room to the South and programming to the West."];
    self.allowsExit = YES;
    return;
  }
  
  [WQ say:@"Snake" words:@"What?!"];
  [WQ print:@"Snake looks stressed out, perhaps you should answer his question with a yes or no"];
  [WQ command:@"Remember to talk, write 'say [what you want to say]'"];
}


@end
