//
//  FoamSword.m
//  Megatron
//
//  Created by orta therox on 28/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "FoamSword.h"

@implementation FoamSword

-(NSString*) description {
  return @"The foam sword hangs neatly from your belt.";
}

-(NSString *)descriptionInRoom {
  return @"There is a sword made out of blue foam on the floor."; 
}

-(NSString*)id {
  return @"sword";
}

-(void)onPickup {
  [WQ print:@"You hang the sword off your belt for safe keeping"];
}

-(void)onDrop {
  [WQ print:@"You drop the sword onto the floor. Making a mess, ah well."];
}

-(void)onUse {
  [WQ print:@"You swing the sword around you head a bit."];
  [WQ wait:3];
  [WQ print:@"Pretty cool."];
}


@end
