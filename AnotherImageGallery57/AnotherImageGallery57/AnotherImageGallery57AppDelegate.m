//
//  AnotherImageGallery57AppDelegate.m
//  AnotherImageGallery57
//
//  Created by orta therox on 02/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "AnotherImageGallery57AppDelegate.h"

#import "MainViewController.h"

@implementation AnotherImageGallery57AppDelegate

@synthesize window = _window;
@synthesize mainViewController = _mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
  self.window.rootViewController = self.mainViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
