//
//  StateViewController.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)performSeagueForState:(State *)state {
    BaseViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier: [state viewControllerId]];
    vc.state = state;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
