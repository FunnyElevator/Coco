//
//  FFAStartViewController.m
//  financialflow
//
//  Created by Fabian on 04.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import "FFAStartViewController.h"

@interface FFAStartViewController () {
    IBOutlet UIButton *islandOneButton;
    IBOutlet UIButton *islandTwoButton;
    IBOutlet UIButton *islandThreeButton;
    IBOutlet UIButton *islandFourButton;
    
    IBOutlet UIButton *getDiplomaButton;
    IBOutlet UIButton *infoButton;
    IBOutlet UIButton *shareButton;
    
    IBOutlet UIView *infoScreen;
    IBOutlet UITextView *infoText;
    IBOutlet UIButton *resetButton;
    __weak IBOutlet UITextView *mainLabel1;
    __weak IBOutlet UITextView *mainLabel2;
    __weak IBOutlet UITextView *mainLabel3;
    __weak IBOutlet UITextView *mainLabel4;
    
}
@property (nonatomic, strong) UIPopoverController *activityPopoverController;

@end

//static FFAStartViewController *playerData;

@implementation FFAStartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // Addust fonts and set up view
    getDiplomaButton.titleLabel.font = [UIFont fontWithName:@"Trade Winds" size:24];
    infoText.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:16];
    resetButton.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:16];
    mainLabel1.font = [UIFont fontWithName:@"Trade Winds" size:22];
    mainLabel2.font = [UIFont fontWithName:@"Trade Winds" size:22];
    mainLabel3.font = [UIFont fontWithName:@"Trade Winds" size:22];
    mainLabel4.font = [UIFont fontWithName:@"Trade Winds" size:22];
    
    //infoButton.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:24];
    //shareButton.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:24];
    
    
    //load user data
    /*
    if (userdata is here) {
        // load user data into game
    } else {
        //initialize user data
    }
     */
    
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    playerData.name = @"It's me!";
    
}

- (void)setUpStartscreen {
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    if (playerData.unlockedLevelTwo== YES) {
        [self unlockButtonTwo];
        [self finishButtonOne];
        
    } else {
        [self resetButtonOne];
    }
    if (playerData.unlockedLevelThree == YES) {
        [self unlockButtonThree];
        [self finishButtonTwo];
    }
    if (playerData.unlockedLevelFour == YES) {
        [self unlockButtonFour];
        [self finishButtonThree];
    }
    if (playerData.unlockedDiploma == YES) {
        [self finishButtonFour];
    }
    
}
- (void)resetButtonOne {
    
}
- (void)unlockButtonTwo {
    [islandTwoButton setImage:[UIImage imageNamed:@"main-level-bg.png"] forState:UIControlStateNormal];
}
- (void)unlockButtonThree {
    [islandThreeButton setImage:[UIImage imageNamed:@"main-level-bg.png"] forState:UIControlStateNormal];
}
- (void)unlockButtonFour {
    [islandFourButton setImage:[UIImage imageNamed:@"main-level-bg.png"] forState:UIControlStateNormal];
}
- (void)finishButtonOne {
    
}
- (void)finishButtonTwo {
    
}
- (void)finishButtonThree {
    
}
- (void)finishButtonFour {
    
}

- (IBAction)showInfoScreen:(id)sender {
    //NSLog(@"show info Screen");
    
    infoScreen.hidden = NO;
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [infoScreen setAlpha:1.0f];
                     }
     ];
}
- (IBAction)hideInfoScreen:(id)sender {
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [infoScreen setAlpha:0.0f];
                     }
     ];
    infoScreen.hidden = YES;
}
- (IBAction)resetGame:(id)sender {
    
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    playerData.name = @"";
    playerData.gender = UnKnown;
    playerData.age = 0;
    playerData.unlockedLevelTwo = NO;
    playerData.unlockedLevelThree = NO;
    playerData.unlockedLevelFour = NO;
    playerData.unlockedDiploma = NO;
    
    CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
    NSString * uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
    CFRelease(newUniqueId);
    playerData.deviceID = uuidString;
    [playerData.answerValues removeAllObjects];
    [self setUpStartscreen];
}

- (IBAction)shareApp:(id)sender
{
    if ([self.activityPopoverController isPopoverVisible]) {
        [self.activityPopoverController dismissPopoverAnimated:YES];
    } else {
        NSString *shareText = [NSString stringWithFormat:@"Prove yourself with Coco"];
        UIImage *shareImage = [UIImage imageNamed:@"coco-logo.png"];
        NSArray *activityItems = @[shareText, shareImage];
        
        
        UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                         applicationActivities:nil];
        vc.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll];
        vc.completionHandler = ^(NSString *activityType, BOOL completed){
            [self.activityPopoverController dismissPopoverAnimated:YES];
        };
        
        if (self.activityPopoverController) {
            [self.activityPopoverController setContentViewController:vc];
        } else {
            self.activityPopoverController = [[UIPopoverController alloc] initWithContentViewController:vc];
        }
        
        [self.activityPopoverController presentPopoverFromRect:[(UIControl *)sender frame]
                                                        inView:self.view
                                      permittedArrowDirections:UIPopoverArrowDirectionAny
                                                      animated:YES];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
