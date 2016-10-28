//
//  SmoothSiltLoamState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "SmoothSiltLoamState.h"
#import "SiltLoamState.h"

@implementation SmoothSiltLoamState

-(BaseState *)nextStateForActionYes {
    return [SiltLoamState new];
}

-(BaseState *)nextStateForActionNo {
    return nil;
}

@end
