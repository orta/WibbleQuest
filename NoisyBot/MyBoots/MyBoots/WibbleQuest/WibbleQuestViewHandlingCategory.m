//
//  WibbleQuestViewHandlingCategory.m
//  MyBoots
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


#import "WibbleQuestViewHandlingCategory.h"

@implementation WibbleQuest (WibbleQuestViewHandlingCategory)
  
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

static const CGFloat IPAD_PORTRAIT_KEYBOARD_HEIGHT = 270;
static const CGFloat IPAD_LANDSCAPE_KEYBOARD_HEIGHT = 720;


- (void)textFieldDidBeginEditing:(UITextField *)textField {
  CGRect textFieldRect =
  [self.view.window convertRect:textField.bounds fromView:textField];
  CGRect viewRect =
  [self.view.window convertRect:self.view.bounds fromView:self.view];
  
  CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
  CGFloat numerator =
  midline - viewRect.origin.y
  - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
  CGFloat denominator =
  (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
  * viewRect.size.height;
  CGFloat heightFraction = numerator / denominator;
  if (heightFraction < 0.0)
  {
    heightFraction = 0.0;
  }
  else if (heightFraction > 1.0)
  {
    heightFraction = 1.0;
  }
  animatedDistanceX = 0.0;
  
  UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
  // PORTRAIT
  if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
    //IPHONE
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      animatedDistanceY = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    } 
    //IPAD
    else {
      if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        heightFraction = -1;
      }
      animatedDistanceY = floor(IPAD_PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
  } 
  
  //LANDSCAPE
  else {
    //IPHONE
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      animatedDistanceY = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    } 
    else {
      //IPAD
      if (orientation == UIInterfaceOrientationLandscapeRight) {
        heightFraction *= -1;
      }

      animatedDistanceX = floor(IPAD_LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
  }
  
  CGRect viewFrame = self.view.frame;
  viewFrame.origin.y -= animatedDistanceY;
  viewFrame.origin.x -= animatedDistanceX;
  
  CGRect webViewFrame = _webView.frame;
  webViewFrame.size.height -= animatedDistanceY;
  webViewFrame.size.width -= animatedDistanceX;
  webViewFrame.origin.y += animatedDistanceY;
  webViewFrame.origin.x += animatedDistanceX;

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationBeginsFromCurrentState:YES];
  [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
  
  [self.view setFrame:viewFrame];
  [_webView setFrame:webViewFrame];

  [UIView commitAnimations];
}



- (void)textFieldDidEndEditing:(UITextField *)textField {
  // do it instantly if you're rotating
  if(rotating){
    self.view.frame = [[UIScreen mainScreen] bounds];
    CGRect webViewFrame = _webView.frame;
    webViewFrame.size.height += animatedDistanceY;
    webViewFrame.size.width += animatedDistanceX;
    webViewFrame.origin.y -= animatedDistanceY;
    webViewFrame.origin.x -= animatedDistanceX;
    _webView.frame = webViewFrame;

    animatedDistanceY = 0;
    animatedDistanceX = 0;
    
  }else{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistanceY;
    viewFrame.origin.x += animatedDistanceX;
    
    CGRect webViewFrame = _webView.frame;
    webViewFrame.size.height += animatedDistanceY;
    webViewFrame.size.width += animatedDistanceX;
    webViewFrame.origin.y -= animatedDistanceY;
    webViewFrame.origin.x -= animatedDistanceX;

    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    [_webView setFrame:webViewFrame];

    [UIView commitAnimations];
    
  }
}

-(void)rotatedToUInterfaceIdiom:(UIInterfaceOrientation) orientation{
  rotating = YES;
  if ([_textField isFirstResponder]) {
    [_textField resignFirstResponder];
  }
  rotating = NO;
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
