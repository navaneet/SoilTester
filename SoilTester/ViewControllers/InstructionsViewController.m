//
//  InformativeViewController.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "InstructionsViewController.h"

@interface InstructionsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;
@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //setting justified alignment text for label.
    NSAttributedString *attributedString = [self attributedStringForString:[self.state labelString]];
    [self.uiLabel setAttributedText:attributedString];
    self.title = NSLocalizedString(@"Instructions", nil);
}

/**
 * Invoked when proceed to next instruction is tapped.
 */
- (IBAction)nextButtonTapped:(id)sender {
    //get the next state for action next
    BaseState *nextState = [self.state nextStateForActionNext];
    [self performSeagueForState:nextState];
}

@end
