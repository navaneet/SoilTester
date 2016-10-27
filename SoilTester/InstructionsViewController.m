//
//  InformativeViewController.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "InstructionsViewController.h"
#import "State.h"
#import "KneadState.h"

@interface InstructionsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;
@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (!self.state) {
        self.state = [KneadState new];
    }
    [self.uiLabel setText:[self.state labelString]];
}

- (IBAction)nextButtonTapped:(id)sender {
    State *nextState;
    //get the next state for action next
    nextState = [self.state nextStateForActionNext];
    NSString *viewControllerId = [nextState viewControllerId];
    if (!viewControllerId) {
        viewControllerId = @"ActionsViewController";
    }
    BaseViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier: viewControllerId];
    vc.state = nextState;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
