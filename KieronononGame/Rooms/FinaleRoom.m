//
//  FinaleRoom.m
//  WibbleQuest
//
//  Created by orta therox on 21/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "FinaleRoom.h"

@implementation FinaleRoom

-(BOOL)playerShouldEnterRoom {
  if ([Player has:@"keytar"] && [Player has:@"microphone"]) {
    return YES;
  }
  [WQ print:@"You wouldn't want to go on stage without a Mic and your Keytar! Better go find them."];
  return NO;
}

@end
