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

@interface WibbleQuest : NSObject <UIWebViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate> {
  IBOutlet UIWebView *_webView;
  IBOutlet UITextField  *_textField;
  IBOutlet UIView *view;
  IBOutlet NSObject<WibbleQuestGameDelegate> * game;
  
  CommandInterpreter *_commandInterpreter;
  
  // these are for the viewhandling categories
  float movementDistance;
  bool animateMovement;
}

@property (retain) UIView * view;
@property (retain) NSMutableArray * rooms;
@property (retain) Room * currentRoom;
@property (retain) NSObject<WibbleQuestGameDelegate> * game;
@property (retain) PlayerInventory *inventory;
@property (retain) Player* player;

@property (retain) NSString * lastPrinted;

+(WibbleQuest *) sharedWibble;

// API used when setting up your game 
-(void) addRoom:(Room*)room;
-(Room *) getRoomByID:(NSString*)id;

// launching
-(void) start;
-(void) describeSurroundings;
-(void) movedRoom;

-(void) purge;
@end

// putting these at the end means that all objects get access
// to methods that should be public inside categories
#import "WibbleQuestPrintingCategory.h"
#import "WibbleQuestViewHandlingCategory.h"