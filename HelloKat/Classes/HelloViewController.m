//
//  HelloViewController.m
//  Hello
//
//  Created by Michael Jaoudi on 7/4/11.
//  Copyright 2011 http://ortatherox.com All rights reserved.
//

#import "HelloViewController.h"

@implementation HelloViewController

-(void)viewDidLoad{
  // Hide these when we load the app.
  [label setHidden:YES];
  [speechBubbleImage setHidden:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)inTextField {
  [speechBubbleImage setHidden:NO];
  [label setHidden:NO];

  // Hide keyboard
	[inTextField resignFirstResponder];
  // Set label text
	label.text = [NSString stringWithFormat:@"Hello %@", inTextField.text];
  return YES;
}

@end
