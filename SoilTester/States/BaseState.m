//
//  State.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "BaseState.h"
#define OBJECT_KEY @"action"

@implementation BaseState {}

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

/**
 * Delegate methods needed for conforming to NSCoding protocol.
 */
- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
    self.action = [decoder decodeObjectForKey:OBJECT_KEY];
    }
    return self;
}

/**
 * Delegate methods needed for conforming to NSCoding protocol.
 */
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.action forKey:OBJECT_KEY];
}

/**
 * Delegate methods needed for conforming to NSCoding protocol which is used to create a deepcopy.
 */
-(id)copyWithZone:(NSZone *)zone {
    NSData *buffer;
    buffer = [NSKeyedArchiver archivedDataWithRootObject:self];
    id copy = [NSKeyedUnarchiver unarchiveObjectWithData: buffer];
    return copy;
}

@end
