//
//  InitialState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "InitialState.h"
#import "DryState.h"
#import "WetState.h"

@implementation InitialState

-(NSString *)labelString {
    return NSLocalizedString(@"Does the soil stay in a ball when squeezed?", nil);
//    return NSLocalizedString(@"Place a handful of soil (with no organic matter or rocks) in your palm. Add a few drops of water and knead soil to break down all the chunks. Soil is at proper consistency when it feels moldable, like moist putty.", nil);
}

-(State *)nextStateForActionYes {
    return [WetState new];
}

-(State *)nextStateForActionNo {
    return [DryState new];
}

@end
