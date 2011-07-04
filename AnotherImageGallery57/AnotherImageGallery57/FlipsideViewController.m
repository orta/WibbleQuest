//
//  FlipsideViewController.m
//  AnotherImageGallery57
//
//  Created by orta therox on 02/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "FlipsideViewController.h"

@implementation FlipsideViewController

@synthesize delegate = _delegate;

#pragma mark - Actions
- (IBAction)birdClicked:(id)sender {
  [self.delegate setMainImage:@"bird.jpg"];
  [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)penguinClicked:(id)sender {
  [self.delegate setMainImage:@"penguin.jpg"];
  [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)robotClicked:(id)sender {
  [self.delegate setMainImage:@"robot.jpg"];
  [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)dangerClicked:(id)sender {
  [self.delegate setMainImage:@"gem.jpg"];
  [self.delegate flipsideViewControllerDidFinish:self];
}
@end
