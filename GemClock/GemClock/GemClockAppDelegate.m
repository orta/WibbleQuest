//
//  GemClockAppDelegate.m
//  GemClock
//
//  Created by orta therox on 03/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "GemClockAppDelegate.h"

#import "GemClockViewController.h"

@implementation GemClockAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.viewController = [[GemClockViewController alloc] initWithNibName:@"GemClockViewController" bundle:nil]; 
  self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}
@end
