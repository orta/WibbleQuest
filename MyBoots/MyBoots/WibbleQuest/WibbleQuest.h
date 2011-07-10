//
//  WibbleQuest.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Room;


@protocol WibbleQuestGameDelegate
@required
  - (void)ready;
  -(NSString *) gameName;
  -(NSString *) gameDescription;
@end


@interface WibbleQuest : NSObject {
  IBOutlet UIWebView *_webView;
  IBOutlet UITextField  *_textField;
  IBOutlet UIView *view;
  IBOutlet NSObject<WibbleQuestGameDelegate> * game;
  
  CGFloat animatedDistance;

}

@property (retain) UIView * view;
@property (retain) NSMutableArray * rooms;
@property (retain) Room * currentRoom;
@property (retain) NSObject<WibbleQuestGameDelegate> * game;

// setting up your game 
-(void) addRoom:(Room*)room;

// launching
-(void) start;


@end

// putting these at the end means that all objects get access
// to methods that should be public inside categories
#import "WibbleQuestPrintingCategory.h"