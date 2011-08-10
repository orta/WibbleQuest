//
//  Item.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : WibbleObject

// Description of the object when before it's been 'get'ed,
// or after it has been 'drop'ed
@property (retain, nonatomic) NSString* descriptionInRoom;

// A String that is used when someone does a command like
// examine [object id]
@property (retain, nonatomic) NSString* examine;

//The room that the item is located in
@property (retain, nonatomic) Room *location;


// Methods to override so that you can react to the players
// interactions

-(void)onPickup;
-(void)onUse;
-(void)onDrop;

-(BOOL)canPickup;
-(BOOL)canDrop;


@end
