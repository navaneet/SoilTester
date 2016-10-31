//
//  Persistance.m
//  SoilTester
//
//  Created by Navaneet Sarma on 30/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "Persistance.h"
#import "BaseState.h"

/**
 * Key used for serializing state data.
 */
#define ARCHIVER_KEY @"states"

@implementation Persistance

+(void) persistToState:(BaseState *)state fromState:(BaseState *)previousState {
    //persist viewcontroller states for actions performed.
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

+(void)removeLastObjectFromPersistantStore {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *array = [[defaults arrayForKey:ARCHIVER_KEY] mutableCopy];
    if (array !=nil) {
    //BaseState *state = [NSKeyedUnarchiver unarchiveObjectWithData:[array lastObject]];
    //NSLog(@"removed %@", state);
    [array removeLastObject];
    [defaults setObject:array forKey:ARCHIVER_KEY];
    [defaults synchronize];
    }
}

+(void)persistsStateArray:(NSMutableArray *)array {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:array forKey:ARCHIVER_KEY];
    [defaults synchronize];
}

+(void)clearAllData {
    //clear the standard defaults.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:ARCHIVER_KEY];
    [defaults synchronize];

}

+(NSMutableArray *)dataFromPersistanceStore {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults arrayForKey:ARCHIVER_KEY] mutableCopy];
}

@end
