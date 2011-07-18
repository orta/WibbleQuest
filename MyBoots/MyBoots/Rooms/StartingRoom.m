//
//  StartingRoom.m
//  MyBoots
//
//  Created by orta therox on 17/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "StartingRoom.h"

@implementation StartingRoom

-(NSDictionary*)dictionaryForExamine {
  return [NSDictionary dictionaryWithObjectsAndKeys:
          @"The pile of clothes are covered in sweat, you don't really want to touch it", @"clothes",
          nil];
}

@end
