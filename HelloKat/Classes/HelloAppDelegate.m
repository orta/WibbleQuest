//
//  HelloAppDelegate.m
//  Hello
//
//  Created by Michael Jaoudi on 7/4/11.
//  Copyright 2011 http://ortatherox.com All rights reserved.
//

#import "HelloAppDelegate.h"
#import "HelloViewController.h"

@implementation HelloAppDelegate

@synthesize window;
@synthesize viewController;

#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Add the view controller's view to the window and display.
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
