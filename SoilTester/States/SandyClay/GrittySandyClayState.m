//
//  GrittySandyClayState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "GrittySandyClayState.h"
#import "SandyClayState.h"

@implementation GrittySandyClayState

-(BaseState *)nextStateForActionYes {
    return [SandyClayState new];
}

-(BaseState *)nextStateForActionNo {
    return nil;
}

@end
