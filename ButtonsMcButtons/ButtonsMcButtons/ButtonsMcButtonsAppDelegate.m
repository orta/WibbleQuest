//
//  ButtonsMcButtonsAppDelegate.m
//  ButtonsMcButtons
//
//  Created by orta therox on 29/06/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ButtonsMcButtonsAppDelegate.h"

#import "ButtonsMcButtonsViewController.h"

@implementation ButtonsMcButtonsAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.viewController = [[ButtonsMcButtonsViewController alloc] initWithNibName:@"ButtonsMcButtonsViewController" bundle:nil]; 
  self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
