//
//  FSM.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "ActionsViewController.h"
#import "InitialState.h"
#import "State.h"
#import "InstructionsViewController.h"

@interface ActionsViewController()
@property (strong, nonatomic) State *state;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uiSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;
@end

@implementation ActionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (!self.state) {
        self.state = [InitialState new];
    }
    [self.uiLabel setText:[self.state labelString]];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.uiSegmentedControl setSelectedSegmentIndex:UISegmentedControlNoSegment];
}

- (IBAction)segmentedButtonValueChanged:(id)sender {
    ActionsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ActionsViewController"];
    InstructionsViewController *ic = [self.storyboard instantiateViewControllerWithIdentifier:@"InstructionsViewController"];
    //Yes
    if (self.uiSegmentedControl.selectedSegmentIndex == 0) {
        //get the next state for action yes
        vc.state = [self.state nextStateForActionYes];
    }
    //No
    else if (self.uiSegmentedControl.selectedSegmentIndex == 1){
        //get the next state for action no
        vc.state = [self.state nextStateForActionNo];
    }    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
