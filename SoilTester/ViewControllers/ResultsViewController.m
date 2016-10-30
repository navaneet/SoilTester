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
    //Adding border to uiTextView.
    self.uiTextView.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    self.uiTextView.layer.borderWidth = 0.2f;
    self.uiTextView.layer.cornerRadius = 4;
    [self updateUI];
}

-(void)updateUI {
    //setting text for label.
    NSString *soilType = [self.state labelString];
    [self.uiLabel setText: soilType];
    self.title = NSLocalizedString(@"Conclusion", nil);
    //Asynchronously update the uiTextView as reading all the states from persistence might take some time on older devices.
    ResultsViewController *__weak weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *tempString = @"";
        int index = 1;
        NSMutableArray *array = [Persistance dataFromPersistanceStore];
        for (NSData *data in array) {
            BaseState *state = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            if ([state action] ) {
                tempString = [tempString stringByAppendingFormat:@"%d) %@ : %@\n\n",index,[state labelString],[[state action] boolValue]?NSLocalizedString(@"Yes",nil):NSLocalizedString(@"No",nil)];
            } else {
                tempString = [tempString stringByAppendingFormat:@"%d) %@\n\n",index,[state labelString]];
            }
            index++;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.uiTextView setAttributedText:[weakSelf attributedStringForString:tempString]];
        });
    });
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    [self updateUI];
}

@end
