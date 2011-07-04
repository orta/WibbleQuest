//
//  ButtonsMcButtonsViewController.m
//  ButtonsMcButtons
//
//  Created by orta therox on 29/06/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ButtonsMcButtonsViewController.h"

@implementation ButtonsMcButtonsViewController

- (IBAction)thanksClicked:(id)sender {
  NSLog(@"Aww that's really nice of you!");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
@end
