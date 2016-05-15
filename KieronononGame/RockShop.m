//
//  RockShop.m
//  WibbleQuest
//
//  Created by pH on 7/17/11.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "RockShop.h"
#import "Microphone.h"
#import "Keytar.h"

@implementation RockShop

-(id)init{
  self = [super init];
  
  [self addItemOfClass: [Microphone class] withValue:45];
  [self addItemOfClass: [Keytar class] withValue:10];
  
  return self;
}

@end
