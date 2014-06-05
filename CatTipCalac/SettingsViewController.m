//
//  SettingsViewController.m
//  CatTipCalac
//
//  Created by Shang-Chieh Wu on 6/5/14.
//  Copyright (c) 2014 WTF. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultLow;
@property (weak, nonatomic) IBOutlet UITextField *defaultOK;
@property (weak, nonatomic) IBOutlet UITextField *defaultHigh;
- (IBAction)OnTap:(id)sender;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"SettingsView load");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    int low = [self.defaultLow.text intValue];
    int ok = [self.defaultOK.text intValue];
    int high = [self.defaultHigh.text intValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:low forKey:@"LOW"];
    [defaults setInteger:ok forKey:@"OK"];
    [defaults setInteger:high forKey:@"HIGH"];

                                       
    [defaults synchronize];
    NSLog(@"view did disappear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTap:(id)sender {
    [self.view endEditing:YES];
}

@end
