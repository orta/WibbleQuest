//
//  Person.h
//  WibbleQuest
//
//  Created by orta therox on 15/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import <Foundation/Foundation.h>

@interface Person : WibbleObject

// Deal specifically with the say command, which is passed in
// as an array of words, with question marks removed.
-(void)respondToSentenceArray:(NSArray*)sentence;

// Called whenever the player enters the room that the 
// person subclass is inside.
-(void)playerEntersSameRoom;

// Called the first time that a player enters the room
// with this person subclass inside.
-(void)respondToPlayerForTheFirstTime;

@end
