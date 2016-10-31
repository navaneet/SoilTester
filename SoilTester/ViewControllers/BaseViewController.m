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

/**
 * Key used for preserving restoration state for runtime state objects.
 */
#define RESTORATION_KEY_STATES @"states"
/**
 * Key used for preserving restoration state for serilaized state objects.
 */
#define RESTORATION_KEY_STATE_SERIALIZED @"serialized"

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
    if ([self isMovingFromParentViewController] | [self isBeingDismissed]) {
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

-(NSAttributedString *)justifiedAttributedStringForString:(NSString *)string {
    NSMutableParagraphStyle *paragraphStyles = [[NSMutableParagraphStyle alloc] init];
    paragraphStyles.alignment                = NSTextAlignmentJustified;
    paragraphStyles.firstLineHeadIndent      = 0.001f;
    paragraphStyles.hyphenationFactor = 0.8f;
    NSString *stringTojustify                = string;
    NSDictionary *attributes                 = @{NSParagraphStyleAttributeName: paragraphStyles};
    NSAttributedString *attributedString     = [[NSAttributedString alloc] initWithString:stringTojustify attributes:attributes];
    return attributedString;
}

/**
 * Delegate method for UIStateRestoring protocol that encodes the app state.
 */
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    //encode app state for state restoration.
    [coder encodeObject:self.state forKey:RESTORATION_KEY_STATES];
    [coder encodeObject:[Persistance dataFromPersistanceStore] forKey:RESTORATION_KEY_STATE_SERIALIZED];
    [super encodeRestorableStateWithCoder:coder];
}

/**
 * Delegate method for UIStateRestoring protocol that decodes the app state.
 */
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    //decode app state for state restoration.
    self.state = [coder decodeObjectForKey:RESTORATION_KEY_STATES];
    NSMutableArray *array = [coder decodeObjectForKey:RESTORATION_KEY_STATE_SERIALIZED];
    [Persistance persistsStateArray:array];
    [super decodeRestorableStateWithCoder:coder];
}

-(void)updateUI {
// hook method, override in subclass.
}

@end
