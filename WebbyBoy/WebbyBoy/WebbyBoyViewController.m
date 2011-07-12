//
//  WebbyBoyViewController.m
//  WebbyBoy
//
//  Created by orta therox on 01/07/2011.
//  Copyright 2011 ortatherox.com. All rights reserved.
//

#import "WebbyBoyViewController.h"

@implementation WebbyBoyViewController

- (void)viewDidLoad {
  //load home page
  [super viewDidLoad];
  [self loadURLString:@"http://orta.github.com"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)inTextField {
  [self loadURLString: [inTextField text]];
  return YES;
}

//  This will do a google search instead
//  [self loadURLString: [@"http://google.com/search?q=" stringByAppendingString:[sender text]]];

- (void) loadURLString: (NSString*)address{  
  //make sure it has a http:// before it  
  if( [address hasPrefix:@"http://"] == FALSE){
    address = [@"http://" stringByAppendingString:address];
  }
  
  NSLog(@"Loading webpage %@", address );
  
  //load it into the UIWebView
  NSURL* url = [NSURL URLWithString:address];
  NSURLRequest * request = [NSURLRequest requestWithURL:url];
  [webView loadRequest: request];
  
  //make the webview the focus
  [webView becomeFirstResponder];
}

// when the URL changes we want to change the address at the top
// this is known as a delegate method, where another class will always
// call a certain method on your code

// this one gets called every time a page finished loading
- (void)webViewDidFinishLoad:(UIWebView *) delagateWebView {
  urlTextField.text = [delagateWebView.request.mainDocumentURL absoluteString];
}

// don't worry so much about things under this

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Allow all orientations
  return YES;
}

- (void)dealloc {
  [webView release];
  [urlTextField release];
  [super dealloc];
}

- (void)viewDidUnload {
  [urlTextField release];
  urlTextField = nil;
  [super viewDidUnload];
}
@end
