//
//  Room.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Creature, Item, Person;

@interface Room : NSObject

@property (retain) NSString* name;
@property (retain) NSString* description;
@property (retain) NSString* id;

@property (retain) Room* north;
@property (retain) Room* east;
@property (retain) Room* south;
@property (retain) Room* west;

@property (retain) NSArray *items;
@property (retain) Creature *encounter;
@property (retain) Person *person;

@property () BOOL visited;

- (void) addItem:(Item*) item;
- (void) describeInventory;

-(Item*)takeItem:(NSString*) itemID;
-(Item *)getItem:(NSString*) itemID;
-(BOOL) hasItem:(NSString*) itemID;

- (void) connectNorth:(Room*)room;
- (void) connectSouth:(Room*)room;
- (void) connectWest:(Room*)room;
- (void) connectEast:(Room*)room;
@end