//
//  OpeningRoom.m
//  Megatron
//
//  Created by orta therox on 26/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "OpeningRoom.h"
#import "Snake.h"

@implementation OpeningRoom

-(BOOL)playerShouldLeaveRoom { 
  Snake*snake = (Snake*)[WQ getRoomByID:@"office"].person;
  
  if(snake.allowsExit){
    return YES;  
  }
  
  [WQ print:@"Snake is in the doorway, you cannot leave, that's just be plain rude."];
  return NO;
}


@end
