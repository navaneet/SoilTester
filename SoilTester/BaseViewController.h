//
//  StateViewController.h
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "State.h"

/**
 * Base View Controller for all state related view controllers.
 */
@interface BaseViewController : UIViewController
/**
 * Property which holds the current state information.
 */
@property (strong, nonatomic) State *state;
/**
 * Pushes the appropriate view controller into the navigation controller for the provided state.
 */
-(void) performSeagueForState:(State *) state;
@end
