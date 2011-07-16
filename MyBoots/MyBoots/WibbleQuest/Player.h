//
//  Player.h
//  MyBoots
//
//  Created by orta therox on 15/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property () int health;
@property () int maxHealth;
@property () NSRange damageRange;

@property (retain) NSMutableDictionary *data;

+(Player*)sharedPlayer;
+(BOOL)has:(NSString*)itemID;


//-(NSString*)getString:(NSString*)key;
//-(void)setString:(NSString *)value forKey:(NSString *)key;
//
//-(int)getInt:(NSString*)key;
//-(void)setInt:(int)value forKey:(NSString *)key;
@end
