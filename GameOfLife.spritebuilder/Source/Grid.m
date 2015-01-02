//
//  Grid.m
//  GameOfLife
//
//  Created by Megan Chen on 1/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

//static variables (cannot be changed)
static const int GRID_ROWS = 8;
static const int GRID_COLS = 10;

@implementation Grid{
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
}

- (void)onEnter{
    [super onEnter];
    [self setupGrid];
    
    // accept touches on the grid
    self.userInteractionEnabled = YES;
}

-(void)setupGrid{
    //divide the grid's size by the number of rows/columns to figure out the right width and height of each cell
    _cellWidth = self.contentSize.width / GRID_COLS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    // initialize the array as a blank NSMutableArray
    _gridArray = [NSMutableArray array];

    //initialize Creatures
    for(int i = 0; i < GRID_ROWS; i++){
        //To create a 2D array in Objective-C: put arrays into arrays
        _gridArray[i] = [NSMutableArray array];
        x = 0;
        
        for(int j = 0; j < GRID_COLS; j++){
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            [self addChild:creature];
            
            //to access an array inside an array...
            _gridArray[i][j] = creature;
            
            //make cratures visible to test this method. this can be commented out after checking that we've filled the grid properly
            creature.isAlive = YES;
            
            x+=_cellWidth;
        }
        y += _cellHeight;
    }
    
}

@end
