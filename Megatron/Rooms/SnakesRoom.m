//
//  SnakesRoom.m
//  Megatron
//
//  Created by orta therox on 26/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "SnakesRoom.h"
#import "KidA.h"

@implementation SnakesRoom

-(BOOL)playerShouldLeaveRoom { 
  KidA* kid = (KidA*)[Room getRoomByID:@"video"].person;
  
  if(kid.caught){
    return YES;
  }
  
  if(kid.faked){
    [[WibbleQuest sharedWibble].game performSelector:@selector(directorCall) withObject:nil afterDelay:30.0f];
    self.description = @"The Kid has vanished, maybe he went to Wawa. Uh oh spaghettios.";
    NSLog(@"call");
  }
  
  if(kid.talked && !kid.faked){
    [WQ print:@"You don't want to leave with this kid in the room, maybe you should say Hi"];
    return NO;
  }
  
  return YES;
}


@end
