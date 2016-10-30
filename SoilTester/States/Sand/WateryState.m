//
//  WateryState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "WateryState.h"
#import "KneadState.h"

@implementation WateryState
-(NSString *)labelString {
    return NSLocalizedString(@"Add dry soil to soak up water.", nil);
}

-(NSString *)viewControllerId {
    return ID_InstructionsViewController;
}

-(BaseState *)nextStateForActionNext {
    return [KneadState new];
}

@end
