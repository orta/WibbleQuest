//
//  HelloWorldLayer.m
//  SedgwickPong
//
//  Created by orta therox on 02/07/2011.
//  Copyright http://ortatherox.com 2011. All rights reserved.
//

#import "PongLayer.h"
@implementation PongLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	PongLayer *layer = [PongLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init {
	if( (self=[super init])) {
    self.isTouchEnabled = YES;
    [self schedule: @selector(step:)];
    
    CCSprite *bg = [CCSprite spriteWithFile:@"bg.jpg"];
    [self addChild:bg];
    bg.position = CGPointMake(self.boundingBox.size.width / 2 , self.boundingBox.size.height/2);
    //Create our objects and add to the screen
    player_1_bar = [CCSprite spriteWithFile:@"bar.png"];
    [self addChild:player_1_bar];
    [player_1_bar setPosition:CGPointMake(40, 160)];
    
    player_2_bar = [CCSprite spriteWithFile:@"bar.png"];
    [self addChild:player_2_bar];
    [player_2_bar setPosition:CGPointMake(440, 160)];
    
    ball = [CCSprite spriteWithFile:@"ball.png"];
    [self addChild:ball];
    
    speed = 2.0f;
    direction = UPLEFT;
  }
	return self;
}

// this is our run loop, where the collision detection
// and ball movement code is held 
-(void) step: (ccTime) delta {
  [self moveBall];
  [self checkForCollisions];
} 



-(void) moveBall {
  CGPoint newPosition = ball.position;
  switch (direction) {
    case UPLEFT:
      newPosition.x -= speed;
      newPosition.y += speed;
      break;
      
    case UPRIGHT:
      newPosition.x += speed;
      newPosition.y += speed;      
      break;
      
    case DOWNLEFT:
      newPosition.x -= speed;
      newPosition.y -= speed;
      break;
      
    case DOWNRIGHT:
      newPosition.x += speed;
      newPosition.y -= speed;
      break;      
  }
//  NSLog(@"old (%f, %f) new (%f, %f)", ball.position.x, ball.position.y, newPosition.x, newPosition.y );
  [ball setPosition:newPosition];
}

-(void) checkForCollisions {
  // check to see if someone's scored
  if(ball.position.x < 0 || ball.position.x > 480) {
    ball.position = CGPointMake(240, 160);
    speed = 2;
  }
  
  // bouncing off the top / bottom
  if( ball.position.y < 0 || ball.position.y > 320 ){
    switch (direction) {
      case UPLEFT:
        direction = DOWNLEFT;
        break;
        
      case UPRIGHT:
        direction = DOWNRIGHT;
        break;
        
      case DOWNLEFT:
        direction = UPLEFT;
        break;
        
      case DOWNRIGHT:
        direction = UPRIGHT;
        break;      
    }

  }
  
  // bouncing off the controls
  if ( CGRectIntersectsRect(ball.boundingBox, player_1_bar.boundingBox)) {
    speed += 0.6;
    if(direction == UPLEFT){
      direction = UPRIGHT;
    }else{
      direction = DOWNRIGHT;
    }    
  }

  if ( CGRectIntersectsRect(ball.boundingBox, player_2_bar.boundingBox)) {
    speed += 0.6;
    if(direction == UPRIGHT){
      direction = UPLEFT;
    }else{
      direction = DOWNLEFT;
    }   
  }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  //forwards all events to ccTouchesMoved
  [self ccTouchesMoved:touches withEvent:event];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
  float left_hand_y = 0;
  float right_hand_y = 0;
  for (UITouch * touch in touches) {
    CGPoint location = [touch locationInView: [touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];

    // get touches on the left hand side
    // set how high it is
    if(location.x < 240){
      left_hand_y = location.y;
    }
    
    // find the same for the right
    if(location.x > 240){
      right_hand_y = location.y;
    }
  }
  
  if (left_hand_y != 0) {
    [player_1_bar setPosition:CGPointMake(40, left_hand_y)];
  }
  
  if (right_hand_y != 0) {
    [player_2_bar setPosition:CGPointMake(460, right_hand_y)];
  }
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc {
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
