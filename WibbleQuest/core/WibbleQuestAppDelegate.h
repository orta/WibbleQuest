//
//  WibbleQuestAppDelegate.h
//  WibbleQuest
//
//  Created by orta therox on 31/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <UIKit/UIKitView.h>

@class MyBootsAppDelegate;

@interface WibbleQuestAppDelegate : NSObject <NSApplicationDelegate> {
  NSWindow *_window;
  UIKitView *chameleonNSView;
  MyBootsAppDelegate *chameleonApp;
}

@property (strong) IBOutlet NSWindow *window;
@property (assign) IBOutlet UIKitView *chameleonNSView;

@end
