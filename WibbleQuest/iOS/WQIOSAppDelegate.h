//
//  WibbleQuestAppDelegate.h
//  WibbleQuest
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import <UIKit/UIKit.h>

@class GameViewController;

@interface WQIOSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GameViewController *mainViewController;

@end
