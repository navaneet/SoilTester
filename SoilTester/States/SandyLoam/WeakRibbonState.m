//
//  WeakRibbonState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "WeakRibbonState.h"
#import "MediumRibbonState.h"
#import "GrittySandyLoamState.h"

@implementation WeakRibbonState

-(NSString *)labelString {
    return NSLocalizedString(@"Does soil make a weak ribbon < 1” before breaking?", nil);
}

-(BaseState *)nextStateForActionYes {
    return [GrittySandyLoamState new];
}

-(BaseState *)nextStateForActionNo {
    return [MediumRibbonState new];
}

-(NSString *)viewControllerId {
    return ID_ActionsViewController;
}

@end
