//
//  WibbleQuest.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Room, PlayerInventory, Player, Creature;

// delegate methods for the Game Object
@protocol WibbleQuestGameDelegate
  - (void) ready;
  -(NSString *) gameName;
  -(NSString *) gameDescription;
@optional
  -(void) help;
  -(void) playerWasBeatenBy:(Creature *)creature;
@end

@class CommandInterpreter;

@interface WibbleQuest : NSObject {
  IBOutlet UIWebView *_webView;
  IBOutlet UITextField  *_textField;
  IBOutlet UIView *view;
  IBOutlet NSObject<WibbleQuestGameDelegate> * game;
  
  CommandInterpreter *_commandInterpreter;
  
  // these are for the viewhandlingacategories
  CGFloat animatedDistanceX;
  CGFloat animatedDistanceY;
}

@property (retain) UIView * view;
@property (retain) NSMutableArray * rooms;
@property (retain) Room * currentRoom;
@property (retain) NSObject<WibbleQuestGameDelegate> * game;
@property (retain) PlayerInventory *inventory;
@property (retain) Player* player;

+ (WibbleQuest *)sharedWibble;

// API used when setting up your game 
-(void) addRoom:(Room*)room;
-(Room *) getRoomByID:(NSString*)id;

// launching
-(void) start;
-(void) describeSurroundings;
-(void) movedRoom;
@end

// putting these at the end means that all objects get access
// to methods that should be public inside categories
#import "WibbleQuestPrintingCategory.h"