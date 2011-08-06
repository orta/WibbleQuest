//
//  WibbleQuestViewHandlingCategory.m
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

// This class is a category, categories allow you to add 
// extra methods to existing classes, in this case it's to
// make sure that the uitextfield is always visible, but
// the code is long and chunky and shouldnt mess up my 
// main wibblequest class, so it's handled here.

// adapted from http://cocoawithlove.com/2008/10/sliding-uitextfields-around-to-avoid.html

#define UP true
#define DOWN false

#import "WibbleQuestViewHandlingCategory.h"

@implementation WibbleQuest (WibbleQuestViewHandlingCategory)
  
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;

static const CGFloat IPHONE_PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat IPHONE_LANDSCAPE_KEYBOARD_HEIGHT = 162;

static const CGFloat IPAD_PORTRAIT_KEYBOARD_HEIGHT = 264;
static const CGFloat IPAD_LANDSCAPE_KEYBOARD_HEIGHT = 352;

-(float)distanceForMovement {
  float distance;
  
  UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
  // PORTRAIT
  if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
    //IPHONE
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      distance = IPHONE_PORTRAIT_KEYBOARD_HEIGHT;
    }
    else {
      //IPAD
      distance = IPAD_PORTRAIT_KEYBOARD_HEIGHT;
    }
  } 
  
  //LANDSCAPE
  else {
    //IPHONE
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      distance = IPHONE_LANDSCAPE_KEYBOARD_HEIGHT;
    } 
    else {
      //IPAD
      distance = IPAD_LANDSCAPE_KEYBOARD_HEIGHT;
    }
  }
  return distance;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
  [_webView stringByEvaluatingJavaScriptFromString:@"scrollToBottom();"];  

  movementDistance = [self distanceForMovement];
  
  CGRect viewFrame = self.view.frame;  
  CGRect webViewFrame = _webView.frame;
  
  UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
  
  if( UIDeviceOrientationIsLandscape( orientation ) ){
    if (orientation == UIInterfaceOrientationLandscapeRight) {
      webViewFrame.size.height -= movementDistance;
      webViewFrame.origin.y += movementDistance;
      viewFrame.origin.x += movementDistance;


    }else{
      webViewFrame.size.height -= movementDistance;
      webViewFrame.origin.y += movementDistance;
      viewFrame.origin.x -= movementDistance;
    }
    
  }else{
    // portrait
    if (orientation == UIInterfaceOrientationPortrait) {
      webViewFrame.size.height -= movementDistance;
      webViewFrame.origin.y += movementDistance;
      viewFrame.origin.y -= movementDistance;
    }else{
      
      webViewFrame.size.height -= movementDistance;
      webViewFrame.origin.y += movementDistance;
      viewFrame.origin.y += movementDistance;
    }
  }

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationBeginsFromCurrentState:YES];
  [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
  
  [self.view setFrame:viewFrame];
  [_webView setFrame:webViewFrame];

  [UIView commitAnimations];
}



- (void)textFieldDidEndEditing:(UITextField *)textField {
  // do it instantly if you're rotating
  UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
  CGRect viewFrame = self.view.frame;    
  CGRect webViewFrame = _webView.frame;
  movementDistance *= -1;
  
  if( UIDeviceOrientationIsLandscape( orientation ) ){
    if (orientation == UIInterfaceOrientationLandscapeRight) {
      webViewFrame.size.height -= movementDistance;
      webViewFrame.origin.y += movementDistance;
      viewFrame.origin.x += movementDistance;
      
      
    }else{
      webViewFrame.size.height -= movementDistance;
      webViewFrame.origin.y += movementDistance;
      viewFrame.origin.x -= movementDistance;
    }
    
  }else{
    // portrait
    if (orientation == UIInterfaceOrientationPortrait) {
      webViewFrame.size.height -= movementDistance;
      webViewFrame.origin.y += movementDistance;
      viewFrame.origin.y -= movementDistance;
    }else{
      
      webViewFrame.size.height -= movementDistance;
      webViewFrame.origin.y += movementDistance;
      viewFrame.origin.y += movementDistance;
    }
  }
  
  if(animateMovement){
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
  }
  
  [self.view setFrame:viewFrame];
  [_webView setFrame:webViewFrame];
  
  if(animateMovement){
    [UIView commitAnimations];
  }
}

-(void)rotatedToUInterfaceIdiom:(UIInterfaceOrientation) orientation{
  animateMovement = YES;
  
  if ([_textField isFirstResponder]) {
    [_textField resignFirstResponder];
  }
  NSString * resizeJS = [NSString stringWithFormat:@"$(html).css('width','%f');", [_webView frame].size.width];
  [_webView stringByEvaluatingJavaScriptFromString:resizeJS];  
  [self print:resizeJS];

  [_webView stringByEvaluatingJavaScriptFromString:@"scrollToBottom();"];  

  animateMovement = NO;
}

#pragma mark gestures on webview
-(void) setupGestureRecognisers {
  UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webViewDoubleTapGesture:)];
  gestureRecognizer.delegate = self;
  gestureRecognizer.numberOfTapsRequired = 2;
  [_webView addGestureRecognizer:gestureRecognizer];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  return YES;
}

-(void)webViewDoubleTapGesture:(id)sender{
  [_textField resignFirstResponder];
}


@end
