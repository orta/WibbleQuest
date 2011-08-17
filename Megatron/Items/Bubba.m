//
//  Bubba.m
//  MyBoots
//
//  Created by orta therox on 22/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Bubba.h"

@implementation Bubba

-(NSString*) description {
  return @"The bubba barely fits in your pocket.";
}

-(NSString *)descriptionInRoom {
 return @"There is a Bubba is wearing a visor, he looks awesome sitting on the wall."; 
}

-(NSString*)id {
  return @"bubba";
}

-(void)onPickup {
  [WQ print:@"Bubba sloshes around as you pick him up"];
  [self addCommandToHelp:@"use bubba" withDescription:@"Take a swig from your Bubba"];
}

-(void)onDrop {
  [WQ print:@"You drop bubba onto the floor and he rolls casually onto his side."];
  [self removeCommandFromHelp:@"use bubba"];

}

-(void)onUse {
  [WQ print:@"You take a swig."];
  [WQ wait:3];
  [WQ print:@"Pretty refreshing."];
}

@end
