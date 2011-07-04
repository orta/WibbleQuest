//
//  HelloAppDelegate.h
//  Hello
//
//  Created by Michael Jaoudi on 7/4/11.
//  Copyright 2011 http://ortatherox.com All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloViewController;

@interface HelloAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HelloViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelloViewController *viewController;

@end

