//
//  Room.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Creature, Item, Person, Store;

@interface Room : WibbleObject

//Keep references to all rooms in the 4 directions
@property (retain) Room* north;
@property (retain) Room* east;
@property (retain) Room* south;
@property (retain) Room* west;

//Hold an instance of a Store if the Room has one
@property (retain) Store* shop;

@property (retain) NSArray *items;
@property (retain) Creature *encounter;
@property (retain) Person *person;

@property () BOOL visited;

// Get the room that the user is in at the minute
+ (Room*) current;

// Add an item into the room's inventory
- (void) addItem:(Item*) item;

// Describe Inventory shows the inventory for the room
// this is done when entering a room.
- (void) describeInventory;

// Take an item out of the room
-(Item*)takeItem:(NSString*) itemID;
-(Item *)getItem:(NSString*) itemID;
-(BOOL) hasItem:(NSString*) itemID;

- (void) connectNorth:(Room*)room;
- (void) connectSouth:(Room*)room;
- (void) connectWest:(Room*)room;
- (void) connectEast:(Room*)room;

-(NSDictionary *)dictionaryForExamine;

-(void)examineWithInput:(NSString*)input;

-(void)playerDidEnterRoom;
-(BOOL)playerShouldEnterRoom;

-(BOOL)playerShouldLeaveRoom;
-(void)playerDidLeaveRoom;

@end
