//
//  SnakeLayer.m
//  snake
//
//  Created by orta therox on 06/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "SnakeLayer.h"
#import "TouchControls.h"

@implementation SnakeLayer

-(id) init {
	if( (self=[super init])) {
    self.isTouchEnabled = YES;
//    [self schedule: @selector(step:)];
    iPad = ( [[CCDirector sharedDirector] winSize].width > 500 );
  }
  return self;
}

-(void) step: (ccTime) delta {
  //runloop
} 


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  //forwards all events to ccTouchesMoved
  [self ccTouchesMoved:touches withEvent:event];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
  int direction;
  for (UITouch * touch in touches) {
    CGPoint location = [touch locationInView: [touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    if (iPad) {
      direction = [TouchControls iPadTouchToDirection:location];
      NSLog(@"direction = %d", direction);
    } else {
      // not working on this yet, har har
      direction = [TouchControls iPhoneTouchToDirection:location];
    }
  }
}

+ (CCScene *) scene {
	CCScene *scene = [CCScene node];
	SnakeLayer *layer = [SnakeLayer node];
	[scene addChild: layer];
	return scene;
}

@end