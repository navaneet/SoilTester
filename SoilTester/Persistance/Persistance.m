//
//  Persistance.m
//  SoilTester
//
//  Created by Navaneet Sarma on 30/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "Persistance.h"

@implementation Persistance

+(void) persistToState:(BaseState *)state fromState:(BaseState *)previousState {
    //persist viewcontroller states for actions performed.
    if ([state action]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *array = [[defaults arrayForKey:ARCHIVER_KEY] mutableCopy];
        if (!array) {
            array = [[NSMutableArray alloc]init];
        }
        BaseState *actualState = [previousState copy];
        actualState.action = state.action;
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:actualState];
        //NSLog(@"inserted %@", actualState);
        [array addObject:data];
        [defaults setObject:array forKey:ARCHIVER_KEY];
        [defaults synchronize];
    }
}

+(void)removeLastObjectFromPersistantStore {
    //specific stuff for being popped off stack
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *array = [[defaults arrayForKey:ARCHIVER_KEY] mutableCopy];
    NSData *lastObject = [array lastObject];
    if (array !=nil & lastObject!=nil) {
    //BaseState *state = [NSKeyedUnarchiver unarchiveObjectWithData:lastObject];
    //NSLog(@"removed %@", state);
    [array removeObject:lastObject];
    [defaults setObject:array forKey:ARCHIVER_KEY];
    [defaults synchronize];
    }
}

+(void)clearAllData {
    //clear the standard defaults.
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ARCHIVER_KEY];
}

+(NSMutableArray *)dataFromPersistanceStore {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults arrayForKey:@"states"] mutableCopy];
}

@end
