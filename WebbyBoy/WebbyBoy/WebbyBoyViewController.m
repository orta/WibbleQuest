//
//  WebbyBoyViewController.m
//  WebbyBoy
//
//  Created by orta therox on 01/07/2011.
//  Copyright 2011 ortatherox.com. All rights reserved.
//

#import "WebbyBoyViewController.h"

@implementation WebbyBoyViewController

- (IBAction)urlTypedIn:(id)sender {
  [self loadURLString: [sender text]];
}

- (IBAction)searchRequestTyped:(id)sender {
  [self loadURLString: [@"http://google.com/search?q=" stringByAppendingString:[sender text]]];
}

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
  [webView becomeFirstResponder];
}

// when the URL changes we want to change the address at the top
// this is known as a delegate method, where another class will always
// call a certain method on your code

// this one gets called every time a page finished loading
- (void)webViewDidFinishLoad:(UIWebView *) delagateWebView {
  urlTextField.text = [delagateWebView.request.mainDocumentURL absoluteString];
}

// add ourselves a back and forwards button
- (IBAction)backPressed:(id)sender {
  [webView goBack];
}

- (IBAction)forwardsPressed:(id)sender {
  [webView goForward];
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
