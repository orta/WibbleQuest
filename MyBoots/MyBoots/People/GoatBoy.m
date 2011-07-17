//
//  GoatBoy.m
//  MyBoots
//
//  Created by orta therox on 16/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "GoatBoy.h"

@implementation GoatBoy

-(void)playerEntersSameRoom {
  if ([Player has:@"keytar"] && !saidKeytar) {
    [WQ say:@"Goat Boy" words:@"Great you have your Keytar! We only need mics now. Go and talk to PX about the microphones."];
    saidKeytar = YES;
  }
  if ([Player has:@"keytar"] && [Player has:@"microphone"] && !saidAllstuff) {
    [WQ say:@"Goat Boy" words:@"That looks like most of your equipment. Got your Mac?"];
    saidAllstuff = YES;
  }
}

-(void)respondToSentenceArray:(NSArray*)sentence {
  if([sentence contains:@"hi", @"hello", nil] ){
    [WQ say:@"Goat Boy" words:@"Finally you're up! Anyway, we're on stage pretty soon, are you ready? got all your stuff for playing?"];
    return;
  }
  
  if([sentence contains:@"stuff", @"playing", nil] ){
    [WQ say:@"Goat Boy" words:@"Yeah, you're gonna need your Keytar and some mics. And it seems that we can't get on stage, but PX is on that."];
    return;
  }

  if([sentence contains:@"stage", @"px", nil] ){
    [WQ say:@"Goat Boy" words:@"Well he's PX, y'know, the bassist...  He's at the bar talking to the owner and seeing if we can drop our stuff off."];
    return;
  }

  if([sentence contains:@"keytar", @"instrument", nil] ){
    [WQ say:@"Goat Boy" words:@"I'm not really sure if I class a keytar as an instrument, but you hit those keys pretty hard."];
    return;
  }
  
  if([sentence contains:@"mic", @"mics", @"microphone", nil] ){
    [WQ say:@"Goat Boy" words:@"We don't normally bring our own mic, so ask PX or the owner of the venue."];
    return;
  }
  
  [WQ print:@"Goat Boy just presumes you're speaking gibberish cause you've just woken up."];
}


@end
