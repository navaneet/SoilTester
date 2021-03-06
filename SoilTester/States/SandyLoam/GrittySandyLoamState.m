//
//  GrittySandyLoam.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "GrittySandyLoamState.h"
#import "SandyLoamState.h"
#import "NonGrittyLoamState.h"

@implementation GrittySandyLoamState

-(BaseState *)nextStateForActionYes {
    return [SandyLoamState new];
}

-(BaseState *)nextStateForActionNo {
    return [NonGrittyLoamState new];
}

@end
