//
//  CreateRibbonState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 28/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "CreateRibbonState.h"
#import "LoamySandState.h"
#import "WeakRibbonState.h"

@implementation CreateRibbonState

-(NSString *)labelString {
    return NSLocalizedString(@"Using your thumb, gently push and squeeze the soil over your index finger, creating a ribbon of soil. Try to create the ribbon with uniform thickness and width. Allow it to extend and break from its own weight. Can you form a ribbon with the soil?", nil);
}

-(BaseState *)nextStateForActionYes {
    return [WeakRibbonState new];
}

-(BaseState *)nextStateForActionNo {
    return [LoamySandState new];
}

-(NSString *)viewControllerId {
    return ID_ActionsViewController;
}

@end
