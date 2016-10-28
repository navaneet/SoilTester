//
//  ResultsViewController.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;
@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //setting text for label.
    NSString *tempString = NSLocalizedString(@"Soil Type Is ", nil);
    NSString *soilType = [self.state labelString];
     [self.uiLabel setText: [tempString stringByAppendingFormat:@"%@", soilType]];
}

@end
