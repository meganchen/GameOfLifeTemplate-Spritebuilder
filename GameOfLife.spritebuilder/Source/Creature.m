//
//  Creature.m
//  GameOfLife
//
//  Created by Megan Chen on 1/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Creature.h"

@implementation Creature

- (instancetype) initCreature{
    //since we made Creature a subclass of CCSprite, the following 'super' refers to CCSprite
    self = [super initWithImageNamed:@'GameOfLifeAssets/Assets/bubble.jpg'];
    
    if(self){
        //initializes to self to not alive
        self.isAlive = NO;
    }
    return self;
}

- (void) setIsAlive:(BOOL)newState{
    //when you create an @property, as we did in Creature.h, an instance variable with a leading underscore is automatically created for you
    _isAlive = newState;
    
    //'visible' is a property of any class that inherits from CCNode. CCSprite is a subclass of CCNode, and creature is a subclass of CCSprite, so Creature has a 'visible' property
    //Creature is visible when it's alive and dead when it's not.
    self.visible = _isAlive;
}

@end
