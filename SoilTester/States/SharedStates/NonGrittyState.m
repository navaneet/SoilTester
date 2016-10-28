//
//  NotGrittyState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "NonGrittyState.h"

@implementation NonGrittyState

-(NSString *)labelString {
    return NSLocalizedString(@"Not gritty or smooth?", nil);
}

-(NSString *)viewControllerId {
    return ID_ActionsViewController;
}

@end
