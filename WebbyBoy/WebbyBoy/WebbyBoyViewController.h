//
//  WebbyBoyViewController.h
//  WebbyBoy
//
//  Created by orta therox on 01/07/2011.
//  Copyright 2011 ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebbyBoyViewController : UIViewController {
  UIWebView *webView;
  IBOutlet UITextField *urlTextField;
}

// When someone presses enter its the same thing
// as pressing a button from the code's perspective
- (IBAction)urlTypedIn:(id)sender;
- (IBAction)searchRequestTyped:(id)sender;

- (IBAction)backPressed:(id)sender;
- (IBAction)forwardsPressed:(id)sender;

// We define our own method to load a web address
// using a string to make it simpler
- (void) loadURLString: (NSString*)address;


@end
