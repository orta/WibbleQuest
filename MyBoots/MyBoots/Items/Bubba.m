//
//  Bubba.m
//  MyBoots
//
//  Created by orta therox on 11/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import "Bubba.h"

@implementation Bubba

- (id)init {
    self = [super init];
    if (self) {
      self.descriptionInRoom = @"There is a round and massive bottle of water here, on the side is the word Bubba.";
      self.id = @"bubba";
      self.name = @"Bubba";
    }
    return self;
}

@end
