//
//  WibbleQuest.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Room;

@interface WibbleQuest : NSObject {
  IBOutlet UIWebView *_webView;
  IBOutlet UITextField  *_textField;
  IBOutlet UIView *view;
  
  CGFloat animatedDistance;

}

@property (retain, nonatomic) UIView * view;
@property (retain, readonly) NSMutableArray * rooms;
@property (retain, nonatomic) Room * currentRoom;

-(void) addRoom:(Room*)room;
-(void) start;
-(void) print:(NSString*)string;

@end
