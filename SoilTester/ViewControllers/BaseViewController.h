//
//  StateViewController.h
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseState.h"

/**
 * BaseViewController is a base view controller for all the state related view controllers and it conforms to uiAlertViewdelegate and
 * uiStateRestoring protocols.
 */
@interface BaseViewController : UIViewController<UIAlertViewDelegate,UIStateRestoring>

/**
 * Property which holds the current state information.
 */
@property (strong, nonatomic) BaseState *state;
/**
 * Pushes the appropriate view controller into the navigation controller for the provided state.
 * @param state state for which to perform view controller navigation operation.
 */
-(void) performSeagueForState:(BaseState *) state;
/**
 * Returns a NSAttributedString which is NSTextAlignmentJustified aligned for the passed in string.
 * @param string strign to be converted to attributed string.
 * @returns NSAttributedString
 */
-(NSAttributedString *) justifiedAttributedStringForString:(NSString *) string;
/**
 * Do updates to user interface within this method. It's called after the app state restoraton process is finished.
 */
-(void) updateUI;
/**
 * Returns a NSAttributedString which is NSTextAlignmentCenter aligned for the passed in string.
 * @param string strign to be converted to attributed string.
 * @returns NSAttributedString
 */
-(NSAttributedString *) centeredAttributedStringForString:(NSString *) string;

@end
