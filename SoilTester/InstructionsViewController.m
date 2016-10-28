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
    NSString *tempString = [self.state labelString];
    NSMutableParagraphStyle *paragraphStyles = [[NSMutableParagraphStyle alloc] init];
    paragraphStyles.alignment                = NSTextAlignmentJustified;
    paragraphStyles.firstLineHeadIndent      = 0.001f;
    paragraphStyles.hyphenationFactor = 0.8f;
    NSString *stringTojustify                = tempString;
    NSDictionary *attributes                 = @{NSParagraphStyleAttributeName: paragraphStyles};
    NSAttributedString *attributedString     = [[NSAttributedString alloc] initWithString:stringTojustify attributes:attributes];
    [self.uiLabel setAttributedText:attributedString];
    self.title = NSLocalizedString(@"Instructions", nil);
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
