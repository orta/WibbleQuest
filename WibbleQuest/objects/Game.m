//
//  Game.m
//  WibbleQuest
//
//  Created by orta therox on 01/08/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Game.h"

@implementation Game
@synthesize wq;

-(NSString *)gameDescription{ return @"No gameDescription set"; }
-(NSString *)gameName{return @"No gameName set"; }
-(void)ready{ [wq start]; }
-(void)playerWasBeatenBy:(Creature*)creature{}

@end
