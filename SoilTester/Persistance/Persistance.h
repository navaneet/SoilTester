//
//  Persistance.h
//  SoilTester
//
//  Created by Navaneet Sarma on 30/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseState.h"

/**
 * Class that manages persistance logic that manages data being stored into NSUserDefaults.
 */
@interface Persistance : NSObject

/**
 * Persists the state passed as argument to NSUserdefaults using the key ARCHIVER_KEY. Also please provide the previous state from which to 
 * persist to.
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
 */
+(NSMutableArray *) dataFromPersistanceStore;

@end
