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
    [self updateUI];
}

/**
 * Invoked when proceed to next instruction is tapped.
 */
- (IBAction)nextButtonTapped:(id)sender {
    //get the next state for action next
    BaseState *nextState = [self.state nextStateForActionNext];
    [self performSeagueForState:nextState];
}

-(void)updateUI {
    //Checking for string length, if length < 30 (smaller label strings), make it NSTextAlignmentCenter otherwise if length > 30 make it
    //NSTextAlignmentJustified.
    NSString *string  = [self.state labelString];
    NSAttributedString *attributedString;
    //edge case for very small instructions text which look odd when left/center aligned.
        if ([string length] > 30) {
            attributedString = [self justifiedAttributedStringForString: string];
        } else {
            attributedString = [self centeredAttributedStringForString:string];
        }
    [self.uiLabel setAttributedText:attributedString];
    self.title = NSLocalizedString(@"Instructions", nil);
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    [self updateUI];
}

@end
