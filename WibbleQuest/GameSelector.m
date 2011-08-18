//
//  GameSelector.m
//  WibbleQuest
//
//  Created by orta therox on 01/08/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//
#import <Foundation/Foundation.h>
#import "GameSelector.h"

#import "MegatronGame.h"
#import "BTPGame.h"

@implementation GameSelector
@synthesize wq;

- (void)awakeFromNib {
  Game<WibbleQuestGameDelegate> * game = [[BTPGame alloc] init];
  game.wq = wq;
  wq.game = game;
}

@end