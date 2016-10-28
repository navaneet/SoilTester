//
//  InitialState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "SqueezeIntoBallState.h"
#import "DryState.h"
#import "WetState.h"

@implementation SqueezeIntoBallState

-(NSString *)labelString {
    return NSLocalizedString(@"Does the soil stay in a ball when squeezed?", nil);
}

-(State *)nextStateForActionYes {
    return [WetState new];
}

-(State *)nextStateForActionNo {
    return [DryState new];
}

-(NSString *)viewControllerId {
    return ID_ActionsViewController;
}

@end
