//
//  NSArray-Contains.h
//  WibbleQuest
//
//  Created by orta therox on 15/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import <Foundation/Foundation.h>

@interface NSArray (NSArray_Contains)

  -(BOOL) contains:(NSString*)firstArg, ... NS_REQUIRES_NIL_TERMINATION;

@end
