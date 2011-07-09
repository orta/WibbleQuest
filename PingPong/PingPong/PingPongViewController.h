//
//  PingPongViewController.h
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ORLocalNetworkProtocol.h"

@class GameKitConnector;

@interface PingPongViewController : UIViewController <ORLocalNetworkProtocol, UITextFieldDelegate> {
  GameKitConnector * connection;
  IBOutlet UITextView * textView;
    
}

// these have to be included to become a delegate 
// of the GameKitConnector
-(void) connected;
-(void)recievedCommand:(NSString *)command withArgument:(NSString *)argument;

-(void) connectionCancelled;
-(void) addConversationString:(NSString *)string;

@end
