//
//  GrittyState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "GrittyState.h"
#import "SandyLoamState.h"

@implementation GrittyState

-(NSString *)labelString {
    return NSLocalizedString(@"Does soil feel really gritty?", nil);
}

-(NSString *)viewControllerId {
    return ID_ActionsViewController;
}

@end
