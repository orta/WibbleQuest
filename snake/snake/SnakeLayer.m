//
//  SnakeLayer.m
//  snake
//
//  Created by orta therox on 06/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "SnakeLayer.h"


@implementation SnakeLayer

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	SnakeLayer *layer = [SnakeLayer node];
	[scene addChild: layer];
	return scene;
}




@end
