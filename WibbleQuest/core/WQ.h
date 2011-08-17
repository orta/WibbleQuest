//
//  WQ.h
//  WibbleQuest
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQ : NSObject

// This class makes it really easy to print to the screen
// otherwise you'd have to get a copy of the shared instance
// so you can write cleaner code
+(void) wait:(int)time;
+(void) print:(NSString*)string, ...;
+(void) say:(NSString*)name words:(NSString*)words;
+(void) heading:(NSString*)string;
+(void) command:(NSString*)string;
+(void) title:(NSString*)string;
+(void) art:(NSString*)string;

@end
