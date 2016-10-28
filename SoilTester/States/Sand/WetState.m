//
//  WetState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "WetState.h"
#import "WateryState.h"
#import "SandState.h"

@implementation WetState
-(NSString *)labelString {
    return NSLocalizedString(@"Is the soil too wet?", nil);
}

-(BaseState *)nextStateForActionNo {
    return [SandState new];
}

-(BaseState *)nextStateForActionYes {
    return [WateryState new];
}

-(NSString *)viewControllerId {
    return ID_ActionsViewController;
}

@end
