//
//  RockShop.m
//  MyBoots
//
//  Created by pH on 7/17/11.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "RockShop.h"


@implementation RockShop

- (NSDictionary *)shopItems { 
  return [NSDictionary dictionaryWithObjectsAndKeys:
          [NSNumber numberWithInt:20],@"microphone",
          [NSNumber numberWithInt:300], @"macbook",
          [NSNumber numberWithInt:10], @"bubba",
          nil];
}

-(NSString *)description{
  return @"A shop for all your rocker needs";
}




@end
