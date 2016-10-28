//
//  SmoothSiltyClayState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "SmoothSiltyClayState.h"
#import "SiltyClayState.h"

@implementation SmoothSiltyClayState

-(BaseState *)nextStateForActionYes {
    return [SiltyClayState new];
}

-(BaseState *)nextStateForActionNo {
    return nil;
}

@end
