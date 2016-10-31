//
//  Persistance.h
//  SoilTester
//
//  Created by Navaneet Sarma on 30/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseState;

/**
 * Class that manages persistance logic that manages data being stored using NSUserDefaults.
 */
@interface Persistance : NSObject

/**
 * Serializes the state passed as argument using NSUserdefaults with the key ARCHIVER_KEY.
 * @param state state to which to persist to.
 * @param previousState previous state from which to persist from.
 */
+(void) persistToState:(BaseState *) state fromState:(BaseState *) previousState;

/**
 * Removes the last persisted state object from NSUserDefaults.
 */
+(void) removeLastObjectFromPersistantStore;

/**
 * Clears all saved state objects from NSUserDefaults.
 */
+(void) clearAllData;

/**
 * Returns a mutable array of persisted data if data exists in NSUserDefaults otherwise returns nil.
 * @returns NSMutableArray
 */
+(NSMutableArray *) dataFromPersistanceStore;

/**
 * Serializes an array of states stored as NSData objects using NSUserdefaults.
 * @param array array of states with NSData Objects.
 */
+(void) persistsStateArray:(NSMutableArray *) array;

@end
