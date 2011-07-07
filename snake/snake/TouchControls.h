//
//  TouchControls.h
//  snake
//
//  Created by orta therox on 06/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchControls : NSObject

+ (int) iPadTouchToDirection:(CGPoint)point;
+ (int) iPhoneTouchToDirection:(CGPoint)point;
@end
