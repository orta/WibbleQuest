//
//  PingPongViewController.m
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "PingPongViewController.h"

@implementation PingPongViewController

-(void)viewDidLoad {
  [super viewDidLoad];
  connection = [[[GameKitConnector alloc] init] retain];
  connection.delegate = self;
  [connection showPlayerPicker];
}
-(IBAction)sendMessage2:(id)sender{
    [connection sendString:[sender text]];
}

-(void) connected {
  NSLog(@"connected");
  [connection sendString:@"hello"];
}

-(void) recievedString:(NSString*)response{
  NSLog(@"recieved %@", response);
}

-(void) connectionCancelled{
  NSLog(@"disconnected");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"Return");
    [connection sendString:textField.text];
    return YES;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

-(void)viewDidUnload{
  [super viewDidUnload];
  [connection release];
}

@end
