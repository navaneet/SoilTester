//
//  SmoothSiltyClayLoamState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "SmoothSiltyClayLoamState.h"
#import "SiltyClayLoamState.h"

@implementation SmoothSiltyClayLoamState

-(BaseState *)nextStateForActionYes {
    return [SiltyClayLoamState new];
}

-(BaseState *)nextStateForActionNo {
    return nil;
}

@end
