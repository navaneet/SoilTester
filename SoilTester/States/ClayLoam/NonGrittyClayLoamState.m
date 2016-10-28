//
//  NonGrittyClayLoamState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "NonGrittyClayLoamState.h"
#import "ClayLoamState.h"
#import "SmoothSiltyClayLoamState.h"

@implementation NonGrittyClayLoamState

-(BaseState *)nextStateForActionYes {
    return [ClayLoamState new];
}

-(BaseState *)nextStateForActionNo {
    return [SmoothSiltyClayLoamState new];
}

@end
