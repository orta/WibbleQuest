//
//  Item.m
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize name, description, examine, descriptionInRoom, id;



-(BOOL)didRespondToCommand:(NSArray*)commandArray {
  NSLog(@"command for %@ not implemented", name);
    return NO;
}

-(NSArray*)commands{ return [NSArray array]; }

-(void)onPickup{}
-(void)onUse{}

@end
