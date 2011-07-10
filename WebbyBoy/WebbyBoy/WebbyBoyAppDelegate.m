//
//  WebbyBoyAppDelegate.m
//  WebbyBoy
//
//  Created by orta therox on 01/07/2011.
//  Copyright 2011 ortatherox.com. All rights reserved.
//

#import "WebbyBoyAppDelegate.h"

#import "WebbyBoyViewController.h"

@implementation WebbyBoyAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.viewController = [[WebbyBoyViewController alloc] initWithNibName:@"WebbyBoyViewController" bundle:nil]; 
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
