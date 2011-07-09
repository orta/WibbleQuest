//
//  PingPongViewController.m
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "PingPongViewController.h"
#import "GameKitConnector.h"

@implementation PingPongViewController

-(void) viewDidLoad {
  [super viewDidLoad];
  connection = [[[GameKitConnector alloc] init] retain];
  connection.delegate = self;
  [connection startPeerToPeer];
  textView.text = @"";
}

-(void) connected {
  [self addConversationString:@"Chat connected"];
}

-(void) addConversationString:(NSString *)string{
  [textView setText:[string stringByAppendingFormat:@"\n %@",textView.text ]];
}

-(void) recievedCommand:(NSString *)command withArgument:(NSString *)argument{
  if([@"chat" isEqualToString:command]){
    [self addConversationString: argument];
  }
}

-(void) connectionCancelled{
  [self addConversationString:@"Chat disconnected"];
}

- (BOOL) textFieldShouldReturn:(UITextField *)inTextField {
  [connection sendCommand:@"chat" withArgument:[NSString stringWithFormat:@"them: %@", inTextField.text]];
  [self addConversationString: [NSString stringWithFormat:@"you: %@", inTextField.text]];
  
  [inTextField setText:@""];
  [inTextField resignFirstResponder];
  return YES;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}
 
-(void)viewDidUnload {
  [connection release];
  [super viewDidUnload];
}

@end
