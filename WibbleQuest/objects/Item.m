//
//  Item.m
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Item.h"

@implementation Item

@synthesize examine, descriptionInRoom, location;

-(void)onPickup{}
-(void)onDrop{}
-(void)onUse{}

-(BOOL)canPickup{ return YES; }
-(BOOL)canDrop{ return YES; }


@end
