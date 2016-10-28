//
//  StrongRibbonState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "StrongRibbonState.h"
#import "GrittySandyClayState.h"

@implementation StrongRibbonState

-(NSString *)labelString {
    return NSLocalizedString(@"Does soil make a strong ribbon >2” before breaking?", nil);
}

-(BaseState *)nextStateForActionYes {
    return [GrittySandyClayState new];
}

-(BaseState *)nextStateForActionNo {
    return nil;
}

-(NSString *)viewControllerId {
    return ID_ActionsViewController;
}

@end
