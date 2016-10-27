//
//  DryState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "DryState.h"
#import "KneadState.h"
#import "WetState.h"

@implementation DryState
-(NSString *)labelString {
    return NSLocalizedString(@"Is the soil too dry?", nil);
 }

-(State *)nextStateForActionYes {
    return [KneadState new];
}

-(State *)nextStateForActionNo {
    return [WetState new];
}

@end
