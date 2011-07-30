//
//  Player.h
//  WibbleQuest
//
//  Created by orta therox on 15/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;
@interface Player : NSObject

// These are normal variables on a player like object
@property () int health;
@property () int maxHealth;

// The damage done as a range, this is before the 
// Creatures damageModifier 
@property () NSRange damageRange;

// A generic currency that is used in shops, or
// can be used anywhere you want really
@property () int money;

// It's normal for Interactive Fiction games to have
// a scoring system so you can see how well you completed the
// game.
@property () int score;

// Access to the shared player object
+(Player *)sharedPlayer;

// Easy methods for asking questions about the current players position
// and inventory.
+(BOOL)isIn:(NSString *)roomID;
+(BOOL)has:(NSString *)itemID;

// More easy methods for dealing with objects
+(BOOL)hasItemByID:(NSString *)itemID;
+(Item *)getItemByID:(NSString *)itemID;
+(void)removeItemByID:(NSString *)itemID;

// Logicalally read teleportation code.
+(void)teleportToRoomWithID:(NSString *)roomID;


// Key Value store used  in get/set String or Int below
@property (retain) NSMutableDictionary *data;

// These provide a Kev Value Store on the player so you can save any 
// details on the player object so you don't have to extend the 
// class to add your own vars to the player.
-(NSString *)getString:(NSString *)key;
-(void)setString:(NSString *)value forKey:(NSString *)key;

-(int)getInt:(NSString *)key;
-(void)setInt:(int)value forKey:(NSString *)key;
@end
