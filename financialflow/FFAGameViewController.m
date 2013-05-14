//
//  FFAGameViewController.m
//  financialflow
//
//  Created by Fabian on 09.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import "FFAGameViewController.h"

@interface FFAGameViewController ()

@end

@implementation FFAGameViewController

#pragma maark - main start functions

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
	// Do any additional setup after loading the view.
    questionTitleLabel.font = [UIFont fontWithName:@"Trade Winds" size:18];
    
    answer1Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:18];
    answer2Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:18];
    answer3Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:18];
    answer4Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:18];
    answer1Button.titleLabel.text = @"Hello";
    
    self.questionaireData = [NSMutableArray array];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - question answering

- (IBAction)continueAfterQuestion:(id)sender {
    
}


@end
