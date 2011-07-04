//
//  ILikeSpringViewController.m
//  ILikeSpring
//
//  Created by orta therox on 03/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "ILikeSpringViewController.h"

@implementation ILikeSpringViewController
@synthesize clickCount;

- (void)viewDidLoad {
  // after loading is finished, grab storedClickCount from User Defaults
  // then update the text on the screen
  [super viewDidLoad];
  self.clickCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"storedClickCount"];
  [self updateTextOnScreen];
}

- (IBAction)agreeClicked:(id)sender {
  // add one to the click count and then store it in User Defaults
  self.clickCount = self.clickCount + 1;
  [[NSUserDefaults standardUserDefaults] setInteger:self.clickCount forKey:@"storedClickCount"];
  [[NSUserDefaults standardUserDefaults] synchronize];
  [self updateTextOnScreen];
}

-(void)updateTextOnScreen {
  clickCountTextField.text = [NSString stringWithFormat:@"You have agreed %d times", self.clickCount];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Landscape only
  return (interfaceOrientation != UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

@end
