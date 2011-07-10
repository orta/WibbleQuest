//
//  Room.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Creature;

@interface Room : NSObject

@property (retain, nonatomic) NSString* name;
@property (retain, nonatomic) NSString* description;
@property (retain, nonatomic) NSString* id;

@property (retain, nonatomic) Room* north;
@property (retain, nonatomic) Room* east;
@property (retain, nonatomic) Room* south;
@property (retain, nonatomic) Room* west;

@property (retain, nonatomic) NSArray *items;
@property (retain, nonatomic) Creature *encounter;

@end
