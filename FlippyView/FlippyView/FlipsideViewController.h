//
//  FlipsideViewController.h
//  FlippyView
//
//  Created by orta therox on 29/06/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (retain, nonatomic) IBOutlet id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
