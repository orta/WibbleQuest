//
//  MainViewController.m
//  AnotherImageGallery57
//
//  Created by orta therox on 02/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

#pragma mark - Flipside View
// communication with the Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    [self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
  FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
  controller.delegate = self;
  controller.modalTransitionStyle =UIModalTransitionStylePartialCurl;
  [self presentModalViewController:controller animated:YES];
}

- (void)setMainImage:(NSString *)imageName{
  [mainImageView setImage:[UIImage imageNamed:imageName]];
}@end
