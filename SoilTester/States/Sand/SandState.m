//
//  SandState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "SandState.h"

@implementation SandState
-(NSString *)labelString {
    return NSLocalizedString(@"Sand", nil);
}

-(NSString *)viewControllerId {
    return _ResultsViewController;
}

@end
