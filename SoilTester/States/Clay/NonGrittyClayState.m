//
//  NonGrittyClayState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "NonGrittyClayState.h"
#import "ClayState.h"
#import "SmoothSiltyClayState.h"

@implementation NonGrittyClayState

-(BaseState *)nextStateForActionYes {
    return [ClayState new];
}

-(BaseState *)nextStateForActionNo {
    return [SmoothSiltyClayState new];
}

@end
