//
//  Creature.h
//  MyBoots
//
//  Created by orta therox on 09/07/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Creature : NSObject

@property () int health;
@property () int maxHealth;

@property () int minDamage;
@property () int maxDamage;

@property (retain, nonatomic) NSString * name;
@property (retain, nonatomic) NSString * description;


@end
