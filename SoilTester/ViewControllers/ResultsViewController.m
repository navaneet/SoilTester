//
//  ResultsViewController.m
//  SoilTester
//
//  Created by Navaneet Sarma on 27/10/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import "ResultsViewController.h"
#import "Persistance.h"

@interface ResultsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;
@property (weak, nonatomic) IBOutlet UITextView *uiTextView;
@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateUI];
}

-(void)updateUI {
    //setting text for label.
    NSString *soilType = [self.state labelString];
    [self.uiLabel setText: soilType];
    self.title = NSLocalizedString(@"Conclusion", nil);
    NSString *tempString = @"";
    NSMutableArray *array = [Persistance dataFromPersistanceStore];
    for (NSData *data in array) {
    BaseState *state = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    tempString = [tempString stringByAppendingFormat:@"%@ : %@\n\n", [state labelString],[[state action] boolValue]?NSLocalizedString(@"Yes",nil):NSLocalizedString(@"No",nil)];
    }
    [self.uiTextView setText:tempString];
}

@end
