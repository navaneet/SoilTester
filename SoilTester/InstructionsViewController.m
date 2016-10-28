//
//  InformativeViewController.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "InstructionsViewController.h"
#import "KneadState.h"

@interface InstructionsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;
@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //initializes the state variable if it's not already initialized.
    if (!self.state) {
        self.state = [KneadState new];
    }
    //setting text for label.
    [self.uiLabel setText:[self.state labelString]];
}

/**
 * Invoked when proceed to next instruction is tapped.
 */
- (IBAction)nextButtonTapped:(id)sender {
    //get the next state for action next
    BaseState *nextState = [self.state nextStateForActionNext];
    [super performSeagueForState:nextState];
}

@end
