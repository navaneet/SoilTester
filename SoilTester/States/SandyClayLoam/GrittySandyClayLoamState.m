//
//  GrittySandyClayLoamState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "GrittySandyClayLoamState.h"
#import "SandyClayLoamState.h"

@implementation GrittySandyClayLoamState

-(BaseState *)nextStateForActionYes {
    return [SandyClayLoamState new];
}

-(BaseState *)nextStateForActionNo {
    return nil;
}

@end
