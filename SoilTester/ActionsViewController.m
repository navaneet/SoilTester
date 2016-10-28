//
//  FSM.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "ActionsViewController.h"

@interface ActionsViewController()
@property (weak, nonatomic) IBOutlet UISegmentedControl *uiSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;
@end

@implementation ActionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //setting font size for segmented control.
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont systemFontOfSize:15], NSFontAttributeName,
                                nil, NSForegroundColorAttributeName, nil];
    [self.uiSegmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    //setting text for uilabel.
    [self.uiLabel setText:[self.state labelString]];
    //remove appropriate segmented button index if the next action is not specified for the provided state.
    if ([self.state nextStateForActionYes] == nil) {
        [self.uiSegmentedControl removeSegmentAtIndex:0 animated:NO];
    }
    if ([self.state nextStateForActionNo] == nil) {
        [self.uiSegmentedControl removeSegmentAtIndex:1 animated:NO];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.uiSegmentedControl setSelectedSegmentIndex:UISegmentedControlNoSegment];
}

- (IBAction)segmentedButtonValueChanged:(id)sender {
    BaseState *nextState;
    //Yes action
    if (self.uiSegmentedControl.selectedSegmentIndex == 0) {
        //get the next state for action yes.
        nextState = [self.state nextStateForActionYes];
    }
    //No action
    else if (self.uiSegmentedControl.selectedSegmentIndex == 1){
        //get the next state for action no.
        nextState = [self.state nextStateForActionNo];
    }
    [super performSeagueForState:nextState];
}

@end
