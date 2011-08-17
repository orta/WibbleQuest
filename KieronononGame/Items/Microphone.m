//
//  Microphone.m
//  WibbleQuest
//
//  Created by orta therox on 16/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Microphone.h"

@implementation Microphone

- (id)init {
  self = [super init];
  if (self) {
    self.description = @"A generic microphone.";
    self.id = @"microphone";
    self.name = @"Microphone";
  }
  return self;
}

-(void) onPickup{
  [WQ print:@"You stuff the microphone in your pocket for safe keeping."];
}



@end
