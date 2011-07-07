//
//  GameKitConnector.m
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "GameKitConnector.h"

@implementation GameKitConnector
@synthesize delegate, peerPicker, session;

- (id)init {
    self = [super init];
    if (self) {
      peerPicker = [[GKPeerPickerController alloc] init];
      peerPicker.delegate = self;
      peerPicker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    }
    
    return self;
}

-(void)showPlayerPicker {
  //Show the connector
	[peerPicker show];
}



#pragma mark PeerPickerControllerDelegate stuff

- (void)peerPickerController:(GKPeerPickerController *)picker didSelectConnectionType:(GKPeerPickerConnectionType)type{
	if (type == GKPeerPickerConnectionTypeOnline) {
    picker.delegate = nil;
    [picker dismiss];
    [picker autorelease];
  }
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker {
  if([delegate respondsToSelector:@selector(connectionCancelled)]){
    [delegate connectionCancelled];
  }
}

- (GKSession *)peerPickerController:(GKPeerPickerController *)picker sessionForConnectionType:(GKPeerPickerConnectionType)type {  
	session = [[GKSession alloc] initWithSessionID:@"or_network" displayName:nil sessionMode:GKSessionModePeer];
  return session;
}

/* Notifies delegate that the peer was connected to a GKSession.
 */
- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)newSession {
  
  NSLog(@"DID CONNECT TO PEER");
	// Use a retaining property to take ownership of the session.
  self.session = newSession;
	// Assumes our object will also become the session's delegate.
  self.session.delegate = self;
  [self.session setDataReceiveHandler: self withContext: nil];
  
	// Remove the picker.
  picker.delegate = nil;
  [picker dismiss];
  [picker autorelease];
	// Start your game.
  [delegate connected];
}

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state {
	switch ((int) state) {
    case GKPeerStateConnected:
			NSLog( @"Connected to %@", peerID);
			break;
		
    case GKPeerStateDisconnected:
			
			break;
  }
}

-(void) sendString:(NSString*) string {
  NSLog(@"DID SEND DATA");
  
  NSError *error;
  NSData * stringData = [string dataUsingEncoding: NSASCIIStringEncoding];
    NSLog(@"String Created: %@",string);
  [self.session sendDataToAllPeers:stringData withDataMode:GKSendDataReliable error:&error];
  if(error){
  //  NSLog(@"ERROR sending string over network %@", [error localizedDescription]);
  }
}

- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context {
  
  
  NSString* response = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(@"DID REVIEVED DATA %@", response);
  [delegate recievedString:response];
}




@end
