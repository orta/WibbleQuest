//
//  AppDelegate.h
//  SedgwickPong
//
//  Created by orta therox on 02/07/2011.
//  Copyright http://ortatherox.com 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
