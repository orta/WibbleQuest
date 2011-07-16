//
//  Microphone.m
//  MyBoots
//
//  Created by orta therox on 16/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Microphone.h"

@implementation Microphone

- (id)init {
  self = [super init];
  if (self) {
    self.description = @"It's a generic microphone.";
    self.id = @"microphone";
    self.name = @"Microphone";
  }
  return self;
}

-(void) onPickup{
  [WQ print:@"You stuff the microphone in your pocket for safe keeping."];
}



@end
