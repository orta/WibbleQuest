//
//  HelloViewController.h
//  Hello
//
//  Created by Michael Jaoudi on 7/4/11.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloViewController : UIViewController <UITextFieldDelegate> {
	IBOutlet UILabel *label;
	IBOutlet UITextField *textField;
  IBOutlet UIImageView *speechBubbleImage;
}

- (BOOL)textFieldShouldReturn:(UITextField *)inTextField;
@end

