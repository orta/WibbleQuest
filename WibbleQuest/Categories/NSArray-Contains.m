//
//  NSArray-Contains.m
//  WibbleQuest
//
//  Created by orta therox on 15/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "NSArray-Contains.h"

@implementation NSArray (NSArray_Contains)


- (BOOL)contains:(NSString *)firstArg, ... {
  NSMutableString *newContentString = [NSMutableString string];
  va_list args;
  va_start(args, firstArg);
  for (NSString *arg = firstArg; arg != nil; arg = va_arg(args, NSString*)) {
    [newContentString appendString:[@"^" stringByAppendingString:arg]];
  }
  va_end(args);
    
  NSArray * words = [newContentString componentsSeparatedByString:@"^"];
  for (NSString * word in words) {
    if ([newContentString rangeOfString:@" "].location != NSNotFound) {
      // is there a space in the nsstring given?
      NSString * selfString = [self componentsJoinedByString:@" "];
      if ([selfString rangeOfString:word].location != NSNotFound) {
        return YES;
      }
    }

    if ([self containsObject:word]) {
      return YES;
    } 
  }
  return NO;
}


@end
