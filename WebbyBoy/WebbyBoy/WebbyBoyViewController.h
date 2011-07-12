//
//  WebbyBoyViewController.h
//  WebbyBoy
//
//  Created by orta therox on 01/07/2011.
//  Copyright 2011 ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebbyBoyViewController : UIViewController {
  IBOutlet UIWebView *webView;
  IBOutlet UITextField *urlTextField;
}

// We define our own method to load a web address
// using a string to make it simpler
- (void) loadURLString: (NSString*)address;

@end