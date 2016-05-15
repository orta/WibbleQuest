//
//  StartingRoom.m
//  WibbleQuest
//
//  Created by orta therox on 17/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "StartingRoom.h"

@implementation StartingRoom

-(NSDictionary*)dictionaryForExamine {
  return [NSDictionary dictionaryWithObjectsAndKeys:
          @"The pile of clothes are covered in sweat, you don't really want to touch it", @"clothes",
          nil];
}

-(BOOL)didRespondToCommand:(NSArray*)commandArray {
  NSString * command = [commandArray first];
  if ([@"sleep" isEqualToString:command]) {
    [WQ print:@"Sleeping probably isn't the smartest move right now."];
    return YES;
  }
  return NO;
}



@end
