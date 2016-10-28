//
//  StateViewController.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "BaseViewController.h"
#import "KneadState.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //initializes the state variable if it's not already initialized.
    if (!self.state) {
        self.state = [KneadState new];
    }
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(dismissCurrentViewControllerStack)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void)performSeagueForState:(BaseState *)state {
    //pushes the appropriate view controller into the navigation stack based on the state's viewControllerId.
    BaseViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier: [state viewControllerId]];
    vc.state = state;
    [self.navigationController pushViewController:vc animated:YES];
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
    }
}

@end
