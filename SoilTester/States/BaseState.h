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
 * State Class for the FSM which conforms to NSCoding protocol.
 */
@interface BaseState : NSObject<NSCoding>

/**
 * Empty base class hook method intended to be overriden in the sub classes to provide the text for the UILabel.
 * @returns NSString
 */
-(NSString *) labelString;
/**
 * Provides the next state for action yes.
 * @returns BaseState
 */
-(BaseState *) nextStateForActionYes;
/**
 * Provides the next state for action no.
 * @returns BaseState
 */
-(BaseState *) nextStateForActionNo;
/**
 * Provides the next state for action next.
 * @returns BaseState
 */
-(BaseState *) nextStateForActionNext;
/**
 * Storyboard id of the ViewController to be used for showing the state information.
 * @returns NSString
 */
-(NSString *) viewControllerId;
/**
 * Preserves action Yes or No for states related to ActionsViewController to be used later for displaying steps of execution within 
 * ResultsViewController.
 */
@property(nonatomic, assign) NSNumber *action;

@end
