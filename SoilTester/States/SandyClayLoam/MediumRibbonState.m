//
//  MediumRibbonState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "MediumRibbonState.h"
#import "StrongRibbonState.h"
#import "GrittySandyClayLoamState.h"

@implementation MediumRibbonState

-(NSString *)labelString {
    return NSLocalizedString(@"Does soil make a medium ribbon 1‐2” long before breaking?", nil);
}

-(BaseState *)nextStateForActionYes {
    return [GrittySandyClayLoamState new];
}

-(BaseState *)nextStateForActionNo {
    return [StrongRibbonState new];
}

-(NSString *)viewControllerId {
    return ID_ActionsViewController;
}

@end
