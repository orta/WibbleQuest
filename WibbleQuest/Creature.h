//
//  Creature.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Creature : WibbleObject

// You need a creature to have health 
// and a max health if you're going to fight them
@property () int health;
@property () int maxHealth;

//Damage Range says the max and the minimum range
// of damage will be done to you, the player.
@property () NSRange damageRange;

// internal, but lets you know if the Creature is mid
// battle, or has been beaten.
@property () BOOL fighting;
@property () BOOL fightable;

// Battle related methods

// An array of strings that are grabbed randomly when the
// Creature takes a turn in battle
-(NSArray*)formattedAttackPhrases;
// An array of strings that are grabbed randomly when the
// Player takes a turn in battle.
-(NSArray*)formattedDefensePhrases;

// You can modify the damage the player does to the Creature
// by modifying the originalDamage and returning that, this is
// used a lot after checking for items in the inventory.
-(int)damageTakenModifier:(int)originalDamage;

// The method that actually does a fight turn
-(void)fight;

// Callbacks for fight interactions so you can add narrative to the
// combat.
-(void)beforeTurn;
-(void)afterTurn;
-(void)beforeFight;
-(void)afterFightLost;
-(void)afterFightWon;

// A creature can hold a conversation just like a person does if you'd 
// like them to.
-(void)respondToSentenceArray:(NSArray*)sentence;

@end