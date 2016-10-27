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
@property (strong, nonatomic) State *state;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
