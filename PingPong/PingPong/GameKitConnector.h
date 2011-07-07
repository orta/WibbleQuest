//
//  GameKitConnector.h
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "ORLocalNetworkProtocol.h"

@interface GameKitConnector : NSObject <GKPeerPickerControllerDelegate, GKSessionDelegate> {
  GKPeerPickerController * peerPicker;
  GKSession * session;
  NSObject <ORLocalNetworkProtocol> *delegate;
}

@property(retain, nonatomic) NSObject<ORLocalNetworkProtocol>* delegate;
@property(retain, nonatomic) GKPeerPickerController* peerPicker;
@property(retain, nonatomic) GKSession* session;

-(void)showPlayerPicker;
-(void)sendString:(NSString*) string;
@end
