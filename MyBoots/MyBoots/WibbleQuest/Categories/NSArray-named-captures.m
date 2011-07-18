//
//  NSArray-named-captures.m
//  MyBoots
//
//  Created by orta therox on 17/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "NSArray-named-captures.h"

@implementation NSArray (NSArray_named_captures)

- (id)first{
  if ([self count] > 0) {
    return [self objectAtIndex:0];
  }
  return nil;
}

- (id)second{
  if ([self count] > 1) {
    return [self objectAtIndex:1];
  }
  return nil;
}
- (id)third{
  if ([self count] > 2) {
    return [self objectAtIndex:2];
  }
  return nil;
}
- (id)last{
  if ([self count] > 0) {
    return [self objectAtIndex:( [self count] - 1) ];
  }
  return nil;
}


@end
