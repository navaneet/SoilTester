//
//  NonGrittyLoamState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "NonGrittyLoamState.h"
#import "LoamState.h"
#import "SmoothSiltLoamState.h"

@implementation NonGrittyLoamState

-(BaseState *)nextStateForActionYes {
    return [LoamState new];
}

-(BaseState *)nextStateForActionNo {
    return [SmoothSiltLoamState new];
}

@end
