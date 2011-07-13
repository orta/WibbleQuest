//
//  WQ.h
//  MyBoots
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQ : NSObject

+(void) print:(NSString*)string, ...;
+(void) heading:(NSString*)string;
+(void) command:(NSString*)string;
+(void) title:(NSString*)string;

@end
