//
//  Flag.m
//  Megatron
//
//  Created by orta therox on 26/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Flag.h"

@implementation Flag


-(NSString*) description {
  return @"There's a little flag in your pocket.";
}

-(NSString *)descriptionInRoom {
  return @"You see a particulary good flag in the bunch."; 
}

-(NSString*)id {
  return @"flag";
}

-(void)onPickup {
  [WQ print:@"You get the flag, wave it about a bit and put it in your back pocket."];
}

-(void)onDrop {
  [WQ print:@"You put the flag down on the floor."];
}

-(void)onUse {
  [WQ print:@"You wave the flag a bit, not really sure what you're trying to get at here"];
}

@end
