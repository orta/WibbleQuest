//
//  ILikeSpringViewController.h
//  ILikeSpring
//
//  Created by orta therox on 03/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ILikeSpringViewController : UIViewController{
  int clickCount;
  UITextField *clickCountTextField;
}


- (void)updateTextOnScreen;
- (IBAction)agreeClicked:(id)sender;
@property() int clickCount;

@end
