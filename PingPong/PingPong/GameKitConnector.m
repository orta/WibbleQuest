//
//  GameKitConnector.m
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//



#import "GameKitConnector.h"

// private non-API related methods
@interface GameKitConnector() 
- (void)decideHost;
@end 




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

-(void)startPeerToPeer {
  //Show the connector
	[peerPicker show];
}

-(void)startHostServer {
  isHostServer = YES;
  [peerPicker show];
}


#pragma mark PeerPickerControllerDelegate stuff
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
  
  if (isHostServer) {
      // when emulating host / server over a p2p network
      // there needs to be a way to detemine host / client
      // I do this by a small game of Rock Paper Scissors
    [self decideHost];
  }else{
    [delegate connected];
  }
}

-(void) sendCommand:(NSString*)command {
  [self sendCommand:command withArgument:@""];
} 


-(void) sendCommand:(NSString*)command withFloat:(float)argument{
  [self sendCommand:command withArgument:[NSString stringWithFormat:@"%f", argument]];
} 

-(void) sendCommand:(NSString*)command withInt:(int)argument{
  [self sendCommand:command withArgument:[NSString stringWithFormat:@"%d", argument]];
} 

-(void) sendCommand:(NSString*)command withArgument:(NSString*)argument{
  NSError *error;
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[NSArray arrayWithObjects:command, argument, nil]];
  [self.session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:&error];
}

- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context{
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if([array count] == 2){
      
      if([@"_HOST_SERVER" isEqualToString:[array objectAtIndex:0]]){
        NSString * theirNumber = [array objectAtIndex:1];
        if ( _hostGuess > [theirNumber intValue]) {
          [delegate isHost];
        }else if(_hostGuess==[theirNumber intValue]){
            [self decideHost];
        }
        else{
          [delegate isClient];
        }
        return;
      }
      
      [delegate recievedCommand:[array objectAtIndex:0] withArgument:[array objectAtIndex:1]];
    }
}

-(void) decideHost {
  _hostGuess =  arc4random() % 10;
  NSString * guess = [NSString stringWithFormat:@"%d", _hostGuess];
  [self sendCommand:@"_HOST_SERVER" withArgument:guess];
}


@end
