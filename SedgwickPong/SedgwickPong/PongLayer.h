//
//  HelloWorldLayer.h
//  SedgwickPong
//
//  Created by orta therox on 02/07/2011.
//  Copyright http://ortatherox.com 2011. All rights reserved.
//

#define UPLEFT 0
#define UPRIGHT 1
#define DOWNLEFT 2
#define DOWNRIGHT 3

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@interface PongLayer : CCLayer {
  CCSprite * player_1_bar;
  CCSprite * player_2_bar;
  CCSprite * ball;
  
  int direction;
  float speed;
}

+(CCScene *) scene;
-(void) moveBall;
-(void) checkForCollisions;
@end
