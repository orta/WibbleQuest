//
//  TouchControls.m
//  snake
//
//  Created by orta therox on 06/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "TouchControls.h"
#import "GameConfig.h"

@implementation TouchControls

+ (int) directionInRect:(CGRect)rect withPoint:(CGPoint)point {
  
  //    int s = y * width / height;
  //    int code = (x > s) + 2*(x > width - s);
  
  // reset the point to treat the x,y of the rect as 0,0
  CGRect zeroRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
  CGPoint zeroPoint = CGPointMake(point.x - rect.origin.x, point.y - rect.origin.y);
  
  int s = zeroPoint.y * zeroRect.size.width / zeroRect.size.height;
  int code = (zeroPoint.x > s) + 2*(zeroPoint.x > zeroRect.size.width - s);
  return code;  
}

+ (int) iPadTouchToDirection:(CGPoint)point{

  if( UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation]) ){    
    CGRect controlBoxLeft = CGRectMake(70, 50, 300, 300);
    CGRect controlBoxRight = CGRectMake(1024-70-300, 50, 300, 300);
 
    if (CGRectContainsPoint(controlBoxLeft, point)) {
      return [self directionInRect:controlBoxLeft withPoint:point];
    }
    
    if (CGRectContainsPoint(controlBoxRight, point)) {
      return [self directionInRect:controlBoxRight withPoint:point];
    }
  
  }
  
  return NO_TOUCH;
}

+ (int) iPhoneTouchToDirection:(CGPoint)point{
  return 0;
}

@end