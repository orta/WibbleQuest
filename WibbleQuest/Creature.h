//
//  Creature.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Creature : WibbleObject

@property () int health;
@property () int maxHealth;

@property () NSRange damageRange;

@property () BOOL fighting;
@property () BOOL fightable;

// Battle related methods

-(NSRange)damageRange;
-(NSArray*)formattedAttackPhrases;
-(NSArray*)formattedDefensePhrases;
-(int)damageTakenModifier:(int)originalDamage;

-(void)fight;

//callbacks
-(void)beforeTurn;
-(void)afterTurn;
-(void)beforeFight;
-(void)afterFightLost;
-(void)afterFightWon;

// talking
-(void)respondToSentenceArray:(NSArray*)sentence;

@end