//
//  State.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "BaseState.h"

@implementation BaseState

-(NSString *)labelString {
    //hook method;
    return nil;
}

-(BaseState *)nextStateForActionNo {
    //hook method;
    return nil;
}

-(BaseState *)nextStateForActionYes {
    //hook method;
    return nil;
}

-(BaseState *)nextStateForActionNext {
    //hook method;
    return nil;
}

-(NSString *)viewControllerId {
    //hook method;
    return nil;
}

@end
