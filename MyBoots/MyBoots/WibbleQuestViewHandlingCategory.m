//
//  WibbleQuestViewHandlingCategory.m
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "WibbleQuestViewHandlingCategory.h"

@implementation WibbleQuest (WibbleQuestViewHandlingCategory)
  
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;


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
  UIInterfaceOrientation orientation =
  [[UIApplication sharedApplication] statusBarOrientation];
  if (orientation == UIInterfaceOrientationPortrait ||
      orientation == UIInterfaceOrientationPortraitUpsideDown)
  {
    animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
  }
  else
  {
    animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
  }
  CGRect viewFrame = self.view.frame;
  viewFrame.origin.y -= animatedDistance;
  
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationBeginsFromCurrentState:YES];
  [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
  
  [self.view setFrame:viewFrame];
  
  [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  CGRect viewFrame = self.view.frame;
  viewFrame.origin.y += animatedDistance;
  
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationBeginsFromCurrentState:YES];
  [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
  
  [self.view setFrame:viewFrame];
  
  [UIView commitAnimations];
}
  

@end
