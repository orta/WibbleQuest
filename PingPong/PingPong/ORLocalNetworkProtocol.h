//
//  ORLocalNetworkProtocol.h
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ORLocalNetworkProtocol <NSObject>

-(void) connected;
-(void) recievedCommand:(NSString *)command withArgument:(NSString *)argument;

@optional

-(void) recievedCommand:(NSString*)command;


// just because you might want this
-(void) connectionCancelled;

// you'll need these if you're going
// to use a host / client architecture
-(void) isHost;
-(void) isClient;

@end
