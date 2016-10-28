//
//  InformationState.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "KneadState.h"
#import "SqueezeIntoBallState.h"

@implementation KneadState

-(NSString *)labelString {
return NSLocalizedString(@"Place a handful of soil (with no organic matter or rocks) in your palm. Add a few drops of water and knead soil to break down all the chunks. Soil is at proper consistency when it feels moldable, like moist putty.", nil);
}

-(NSString *)viewControllerId {
return ID_InstructionsViewController;
}

-(BaseState *)nextStateForActionNext {
return [SqueezeIntoBallState new];
}

@end
