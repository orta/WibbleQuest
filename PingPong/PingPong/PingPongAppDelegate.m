//
//  PingPongAppDelegate.m
//  PingPong
//
//  Created by orta therox on 04/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "PingPongAppDelegate.h"

#import "PingPongViewController.h"

@implementation PingPongAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      self.viewController = [[PingPongViewController alloc] initWithNibName:@"PingPongViewController_iPhone" bundle:nil]; 
  } else {
      self.viewController = [[PingPongViewController alloc] initWithNibName:@"PingPongViewController_iPad" bundle:nil]; 
  }
  self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
