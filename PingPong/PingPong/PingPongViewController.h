//
//  PingPongViewController.h
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ORLocalNetworkProtocol.h"
#import "GameKitConnector.h"

@interface PingPongViewController : UIViewController <ORLocalNetworkProtocol, UITextFieldDelegate>{
  GameKitConnector * connection;

    
}

// these have to be included to become a delegate 
// of the GameKitConnector
-(void) connected;
-(void) recievedString:(NSString*)response;
-(IBAction)sendMessage2:(id)sender;
-(IBAction)sendMessage:(id)sender;
@end
