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
 * Class that manages persistance logic that manages the data being serialized and de-serialized to NSUserDefaults.
 */
@interface Persistence : NSObject

/**
 * Serializes the state passed as argument using NSUserdefaults with the key ARCHIVER_KEY.
 * @param state state to which to persist to.
 * @param previousState previous state from which to persist from.
 * @returns BOOL YES if the data was saved successfully to disk, otherwise NO.
 */
+(BOOL) persistToState:(BaseState *) state fromState:(BaseState *) previousState;

/**
 * Removes the last persisted state object from NSUserDefaults for the key ARCHIVER_KEY.
 * @returns BOOL YES if the operation was successful, otherwise NO.
 */
+(BOOL) removeLastObjectFromPersistantStore;

/**
 * Clears all saved state objects from NSUserDefaults.
 * @returns BOOL YES if the operation was successful, otherwise NO.
 */
+(BOOL) clearAllData;

/**
 * Returns an array of persisted data if data exists for the key ARCHIVER_KEY in NSUserDefaults otherwise returns nil.
 * @returns NSArray An array of state objects stored as NSData objects which need to be unarchived using NSKeyedUnarchiver.
 */
+(NSArray *) dataFromPersistanceStore;

/**
 * Serializes an array of states stored as NSData objects using NSKeyedArchiver to NSUserdefaults.
 * @param array array of states with NSData Objects.
 * @returns BOOL YES if the data was saved successfully to disk, otherwise NO.
 */
+(BOOL) persistStateArray:(NSArray *) array;

@end
