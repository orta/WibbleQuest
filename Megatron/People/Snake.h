//
//  Snake.h
//  Megatron
//
//  Created by orta therox on 26/07/2011.
//  Copyright 2011 http://ortatherox.com. Licensed under Creative Commons
//

#import "Person.h"

@interface Snake : Person {
  bool saidHi;
  bool replied;
  bool allowsExit;
}

@property () bool allowsExit;

@end
