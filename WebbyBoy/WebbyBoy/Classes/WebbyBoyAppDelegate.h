//
//  WebbyBoyAppDelegate.h
//  WebbyBoy
//
//  Created by orta on 01/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebbyBoyViewController;

@interface WebbyBoyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WebbyBoyViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebbyBoyViewController *viewController;

@end

