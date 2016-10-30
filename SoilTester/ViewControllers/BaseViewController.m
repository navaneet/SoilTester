//
//  StateViewController.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "BaseViewController.h"
#import "KneadState.h"
#import "Persistance.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //initializes the state variable if it's not already initialized for the first run.
    if (!self.state) {
        self.state = [KneadState new];
    }
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(dismissCurrentViewControllerStack)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void)performSeagueForState:(BaseState *)state {
    //pushes the appropriate view controller into the navigation stack based on the state's viewControllerId.
    NSString *vc_id = [state viewControllerId];
    //check if view controller id has been specified by the state class or not.
    if (vc_id) {
        BaseViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier: vc_id];
        vc.state = state;
        [self.navigationController pushViewController:vc animated:YES];
        //persist Action states to show in ResultsViewController.
        [Persistance persistToState:state fromState:self.state];
    }else {
        NSLog(@"View Controller Id not specified for state: %@", state);
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //Detects back pressed on view controller.
    if ([self isMovingFromParentViewController]) {
        //Remove the last persisted object.
        [Persistance removeLastObjectFromPersistantStore];
    }
}

/**
 * Shows an alert to the user asking if he/she wants to start over from the beginning.
 */
-(void) dismissCurrentViewControllerStack {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"Do you want to start over from the beginning?"
    , nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:NSLocalizedString(@"Ok", nil),nil];
    [alert show];
}

/**
 * UIAlertView delegate method.
 */
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
        //pops the navigation stack.
        [self.navigationController popToRootViewControllerAnimated:YES];
        [Persistance clearAllData];
    }
}

-(NSAttributedString *)attributedStringForString:(NSString *)string {
    NSMutableParagraphStyle *paragraphStyles = [[NSMutableParagraphStyle alloc] init];
    if ([string length] >30) {
        paragraphStyles.alignment                = NSTextAlignmentJustified;
    } else {
        paragraphStyles.alignment                = NSTextAlignmentCenter;
    }
    paragraphStyles.firstLineHeadIndent      = 0.001f;
    paragraphStyles.hyphenationFactor = 0.8f;
    NSString *stringTojustify                = string;
    NSDictionary *attributes                 = @{NSParagraphStyleAttributeName: paragraphStyles};
    NSAttributedString *attributedString     = [[NSAttributedString alloc] initWithString:stringTojustify attributes:attributes];
    return attributedString;
}

-(void)updateUI {
// hook method, override in subclass.
}

@end
