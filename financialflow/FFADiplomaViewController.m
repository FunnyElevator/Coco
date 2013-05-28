//
//  FFADiplomaViewController.m
//  financialflow
//
//  Created by Fabian on 15.05.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import "FFADiplomaViewController.h"

@interface FFADiplomaViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation FFADiplomaViewController

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
    
    self.backButton.titleLabel.font = [UIFont fontWithName:@"Trade Winds" size:22];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeDiplomaView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
