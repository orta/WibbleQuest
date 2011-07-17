//
//  MyBootsAppDelegate.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameViewController;

@interface MyBootsAppDelegate : UIResponder <UIApplicationDelegate>

@property (/*strong, nonatomic*/) UIWindow *window;

@property (/*strong, nonatomic*/) GameViewController *mainViewController;

@end
