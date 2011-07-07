//
//  ORLocalNetworkProtocol.h
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ORLocalNetworkProtocol <NSObject>

-(void) connectionCancelled;

@required

-(void) connected;
-(void) recievedString:(NSString*)response;

@end
