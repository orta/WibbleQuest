//
//  MagicSwipeViewController.h
//  MagicSwipe
//
//  Created by orta therox on 03/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagicSwipeViewController : UIViewController {
  UIImageView *coinImageView;  
  BOOL isHeads;
}

-(void)switchImage;

@end
