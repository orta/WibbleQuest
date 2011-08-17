//
//  WibbleQuest.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Room, PlayerInventory, Player, Creature, CommandInterpreter, Game;

// delegate methods for the Game Object, these are functions that
// the Game object needs to support so that the game will work correctly.
@protocol WibbleQuestGameDelegate
  - (void) ready;
  -(NSString *) gameName;
  -(NSString *) gameDescription;
@optional
// These methods are optional, for example you can use the original help file, or completely overwrite it with your own version. 
  -(void) help;
  -(void) playerWasBeatenBy:(Creature *)creature;
@end

// WibbleQuest is the delegate for quite a few objects.
@interface WibbleQuest : NSObject <UIWebViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate> {

  //IBOutlets for connecting up the game in the XIB
  IBOutlet UIWebView *_webView;
  IBOutlet UITextField  *_textField;
  IBOutlet UIView *view;
  IBOutlet Game<WibbleQuestGameDelegate> * game;
  
  CommandInterpreter *_commandInterpreter;
  
  // these are for the viewhandling categories
  float movementDistance;
  bool animateMovement;
  
  // for handling drag commands up and down on the text field
  int _commandIndex;
}

// Variables
@property (retain) UIView * view;
@property (retain) NSMutableArray * rooms;
@property (retain) Room * currentRoom;
@property (retain) Game<WibbleQuestGameDelegate> * game;
@property (retain) PlayerInventory *inventory;
@property (retain) Player* player;

@property (retain) NSMutableArray* previousCommands;

@property (retain) NSString * lastPrinted;

@property() float tickerInterval;
@property(nonatomic, retain) NSTimer *timer;

+(WibbleQuest *) sharedWibble;

// Add rooms to a global list of rooms, this means 
// you can get it by ID
-(void) addRoom:(Room*)room;
-(Room *) getRoomByID:(NSString*)id;


// Start the game
-(void) start;

// This method describes the room and items in it,
// its called by moving rooms, or by teleporting.
-(void) describeSurroundings;
-(void) movedRoom;

// Restart the game
-(void) restart;

// Clears the resources like Rooms / Items etc, 
// it's rarely used in games but used in Testing quite a lot. 
-(void) purge;

-(void) tick;
@end

// putting these at the end means that all objects get access
// to methods that should be public inside categories
#import "WibbleQuestPrintingCategory.h"
#import "WibbleQuestViewHandlingCategory.h"
#import "WibbleQuestSwipeHandlers.h"