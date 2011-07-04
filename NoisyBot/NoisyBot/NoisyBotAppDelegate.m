//
//  NoisyBotAppDelegate.m
//  NoisyBot
//
//  Created by orta therox on 30/06/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoisyBotAppDelegate.h"

#import "NoisyBotViewController.h"

@implementation NoisyBotAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.viewController = [[NoisyBotViewController alloc] initWithNibName:@"NoisyBotViewController" bundle:nil]; 
  self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
