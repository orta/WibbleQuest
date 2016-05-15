//
//  WibbleQuestAppDelegate.m
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "WQIOSAppDelegate.h"
#import "GameViewController.h"

#if RUN_KIF_TESTS
#import "WBTestController.h"
#endif

#if RUN_WALKTHROUGH
#import "Walkthrough.h"
#endif

@implementation WQIOSAppDelegate

@synthesize window = _window;
@synthesize mainViewController = _mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
    // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
self.mainViewController = [[GameViewController alloc] initWithNibName:@"MainViewController" bundle:nil]; 

  self.window.rootViewController = self.mainViewController;
    [self.window makeKeyAndVisible];
  
#if RUN_WALKTHROUGH
  [[Walkthrough sharedInstance] startTestingWithCompletionBlock:^{
    [WQ print:@"</p><h1 class='gameover'>Walkthrough Over</h1><p>"];
  }];
  return YES;
#endif
  
#if RUN_KIF_TESTS
  [[WBTestController sharedInstance] startTestingWithCompletionBlock:^{
    // Exit after the tests complete so that CI knows we're done
    exit([[WBTestController sharedInstance] failureCount]);
  }];
#endif

  
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

@end
