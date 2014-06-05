//
//  CalcViewController.m
//  CatTipCalac
//
//  Created by Shang-Chieh Wu on 6/4/14.
//  Copyright (c) 2014 WTF. All rights reserved.
//

#import "CalcViewController.h"
#import "SettingsViewController.h"

@interface CalcViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *predefinedTipPar;
- (IBAction)OnTap:(id)sender;

- (void)updateValue:(Boolean)readSetting;
- (void)onSettingsButton;

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:10 forKey:@"LOW"];
    [defaults setInteger:15 forKey:@"OK"];
    [defaults setInteger:20 forKey:@"HIGH"];
    [self updateValue:FALSE];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self updateValue:TRUE];
    NSLog(@"view did appear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValue:FALSE];
}

     
- (void) updateValue:(Boolean)readSetting{

    NSMutableArray *tipValues;
    
    if (readSetting)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        int low = [defaults integerForKey:@"LOW"];
        int ok = [defaults integerForKey:@"OK"];
        int high = [defaults integerForKey:@"HIGH"];
            
        // NSLog([NSString stringWithFormat:@"%d %d %d", low, ok, high]);
        
        [self.predefinedTipPar setTitle:[NSString stringWithFormat:@"%d", low] forSegmentAtIndex:0];
        [self.predefinedTipPar setTitle:[NSString stringWithFormat:@"%d", ok] forSegmentAtIndex:1];
        [self.predefinedTipPar setTitle:[NSString stringWithFormat:@"%d", high] forSegmentAtIndex:2];

        [tipValues addObject:@(low*0.01)];
        [tipValues addObject:@(ok*0.01)];
        [tipValues addObject:@(high*0.01)];
    }
    else {
        // tipValues = @[@(0.1), @(0.15), @(0.20)];
        [tipValues addObject:@(0.1)];
        [tipValues addObject:@(0.15)];
        [tipValues addObject:@(0.2)];
    }
    
    float bill = [self.billAmount.text floatValue];
    float tip = bill * [tipValues [self.predefinedTipPar.selectedSegmentIndex] floatValue] ;
    float total = bill + tip;
         
    self.tipAmount.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.totalAmount.text = [NSString stringWithFormat:@"$%0.2f", total];
}

- (void) onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}


@end
