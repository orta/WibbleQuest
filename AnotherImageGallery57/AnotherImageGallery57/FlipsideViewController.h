//
//  FlipsideViewController.h
//  AnotherImageGallery57
//
//  Created by orta therox on 02/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

// A protocol is a way of saying, delegate will have these methods
@protocol FlipsideViewControllerDelegate
- (void)setMainImage:(NSString *)imageName;
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

- (IBAction)birdClicked:(id)sender;
- (IBAction)penguinClicked:(id)sender;
- (IBAction)robotClicked:(id)sender;
- (IBAction)dangerClicked:(id)sender;

@property (retain, nonatomic) IBOutlet id <FlipsideViewControllerDelegate> delegate;

@end
