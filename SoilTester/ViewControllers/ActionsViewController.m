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
    [self updateUI];
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
        nextState.action = [NSNumber numberWithBool:YES];
    }
    //No action
    else if (self.uiSegmentedControl.selectedSegmentIndex == 1){
        //get the next state for action no.
        nextState = [self.state nextStateForActionNo];
        nextState.action = [NSNumber numberWithBool:NO];
    }
    [super performSeagueForState:nextState];
}

-(void)updateUI {
    //setting font size for segmented control.
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont systemFontOfSize:15], NSFontAttributeName,
                                nil, NSForegroundColorAttributeName, nil];
    [self.uiSegmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    //setting justified alignment text for label.
    NSAttributedString *attributedString = [self attributedStringForString:[self.state labelString]];
    [self.uiLabel setAttributedText:attributedString];
    
    //remove the placeholder segments for segmented control and add segments as per the actions availabile from the provided state.
    [self.uiSegmentedControl removeAllSegments];
    if ([self.state nextStateForActionYes] != nil) {
        [self.uiSegmentedControl insertSegmentWithTitle:NSLocalizedString(@"Yes", nil) atIndex:0 animated:NO];
    }
    if ([self.state nextStateForActionNo] != nil) {
        [self.uiSegmentedControl insertSegmentWithTitle:NSLocalizedString(@"No", nil) atIndex:1 animated:NO];
    }
    self.title = NSLocalizedString(@"Findings", nil);
}

@end
