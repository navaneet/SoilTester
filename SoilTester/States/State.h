//
//  State.h
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Base class for all the states */
@interface State : NSObject

/* Empty base class hook method intended to be overriden in the sub classes to provide the text for the UILabel */
-(NSString *) labelString;
/* Provides the next state for action yes for the FSM */
-(State *) nextStateForActionYes;
/* Provides the next state for action no for the FSM */
-(State *) nextStateForActionNo;

@end
