//
//  State.h
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * View Controller ids that are used to show the state information.
 */
#define ID_InstructionsViewController @"InstructionsViewController"
#define ID_ActionsViewController      @"ActionsViewController"
#define ID_ResultsViewController      @"ResultsViewController"

/**
 * Base class for all the states.
 */
@interface State : NSObject

/**
 * Empty base class hook method intended to be overriden in the sub classes to provide the text for the UILabel.
 */
-(NSString *) labelString;
/**
 * Provides the next state for action yes.
 */
-(State *) nextStateForActionYes;
/**
 * Provides the next state for action no.
 */
-(State *) nextStateForActionNo;
/**
 * Provides the next state for action next.
 */
-(State *) nextStateForActionNext;
/**
 * Storyboard id of the ViewController to be used for showing the state information.
 */
-(NSString *) viewControllerId;

@end
