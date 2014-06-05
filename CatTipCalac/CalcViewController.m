//
//  CalcViewController.m
//  CatTipCalac
//
//  Created by Shang-Chieh Wu on 6/4/14.
//  Copyright (c) 2014 WTF. All rights reserved.
//

#import "CalcViewController.h"

@interface CalcViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *predefinedTipPar;
- (IBAction)OnTap:(id)sender;
- (void)updateValues;

@end

@implementation CalcViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Cat Tip Calculator";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    float bill = [self.billAmount.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.20)];
    float tip = bill * [tipValues[self.predefinedTipPar.selectedSegmentIndex] floatValue];
    float total = bill + tip;
    
    self.tipAmount.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.totalAmount.text = [NSString stringWithFormat:@"$%0.2f", total];
    
}
@end
