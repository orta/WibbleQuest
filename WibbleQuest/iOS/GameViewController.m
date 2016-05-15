//
//  MainViewController.m
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "GameViewController.h"
#import "WibbleQuest.h"

@implementation GameViewController

@synthesize flipsidePopoverController = _flipsidePopoverController;

+ (GameViewController *)viewController {
    GameViewController *controller = nil;
controller = [[GameViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    return controller;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  [wq rotatedToUInterfaceIdiom: interfaceOrientation];
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation == UIInterfaceOrientationPortrait);
  } else {
      return YES;
  }
}

#pragma mark - Flipside View Controller

- (void)SettingsViewControllerDidFinish:(SettingsViewController *)controller
{

        [self.flipsidePopoverController dismissPopoverAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{

        if (!self.flipsidePopoverController) {
            SettingsViewController *controller = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
            controller.delegate = self;
            
            self.flipsidePopoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
        }
        if ([self.flipsidePopoverController isPopoverVisible]) {
            [self.flipsidePopoverController dismissPopoverAnimated:YES];
        } else {
            [self.flipsidePopoverController presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
        }
}
@end
