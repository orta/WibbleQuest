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

@property (retain) NSArray* items;
@property (retain) Creature* encounter;
@property (retain) Person* person;

@property () BOOL visited;

// Get the room that the user is in at the minute
+ (Room *) current;

// Add an item into the room's inventory
- (void) addItem:(Item*) item;

// Describe Inventory shows the inventory for the room
// this is done when entering a room.
- (void) describeInventory;

// Take an item out of the room, also removing it
-(Item *)takeItem:(NSString*) itemID;
// Get an item from from the room
-(Item *)getItem:(NSString*) itemID;
// Returns true if the Item is in the room
-(BOOL) hasItem:(NSString*) itemID;

// Bi-Directional connections for rooms,
// basically a quick way of doing x.north = y
// y.south = x.
- (void) connectNorth:(Room*)room;
- (void) connectSouth:(Room*)room;
- (void) connectWest:(Room*)room;
- (void) connectEast:(Room*)room;

+(void)connectRoomID:(NSString*)roomID1 connectNorthToRoomID:(NSString*)roomID2;
+(void)connectRoomID:(NSString*)roomID1 connectSouthToRoomID:(NSString*)roomID2;
+(void)connectRoomID:(NSString*)roomID1 connectWestToRoomID:(NSString*)roomID2;
+(void)connectRoomID:(NSString*)roomID1 connectEastToRoomID:(NSString*)roomID2;


// Provides a NSDictionary of keys and values that are 
// acted upon when using the examine command inside a room.
-(NSDictionary *)dictionaryForExamine;

-(void)examineWithInput:(NSString *)input;

// By overriding these methonds you can narrate the story 
// dealing when a player enters or leaves a room.
-(void)playerDidEnterRoom;
-(void)playerDidLeaveRoom;

// By overriding these methods in your subclass you can force a 
// player to either not get into a room or to be stuck in a room, you do this
// by returning YES or NO. You will need to add an explaination because this method
// will silently stop players.
-(BOOL)playerShouldEnterRoom;
-(BOOL)playerShouldLeaveRoom;


@end
