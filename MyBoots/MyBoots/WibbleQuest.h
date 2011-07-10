//
//  WibbleQuest.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WibbleQuest : NSObject < UITextFieldDelegate > {
  IBOutlet UIWebView *_webView;
  IBOutlet UITextField  *_textField;
  IBOutlet UIView *view;
  
  CGFloat animatedDistance;

}

@property (retain, nonatomic) UIView * view;

@end
