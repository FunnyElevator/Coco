//
//  FFAStartViewController.m
//  financialflow
//
//  Created by Fabian on 04.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import "FFAStartViewController.h"

@interface FFAStartViewController () {
    IBOutlet UIButton *islandButton1;
    IBOutlet UIButton *islandButton2;
    IBOutlet UIButton *islandButton3;
    IBOutlet UIButton *islandButton4;
    
    __weak IBOutlet UIImageView *islandImage1;
    __weak IBOutlet UIImageView *islandImage2;
    __weak IBOutlet UIImageView *islandImage3;
    __weak IBOutlet UIImageView *islandImage4;
    
    __weak IBOutlet UIImageView *playButtonImage1;
    __weak IBOutlet UIImageView *playButtonImage2;
    __weak IBOutlet UIImageView *playButtonImage3;
    __weak IBOutlet UIImageView *playButtonImage4;
    
    __weak IBOutlet UIImageView *landmapImage1;
    __weak IBOutlet UIImageView *landmapImage2;
    __weak IBOutlet UIImageView *landmapImage3;
    __weak IBOutlet UIImageView *landmapImage4;
    
    __weak IBOutlet UIImageView *flagImage1;
    __weak IBOutlet UIImageView *flagImage2;
    __weak IBOutlet UIImageView *flagImage3;
    __weak IBOutlet UIImageView *flagImage4;
    
    __weak IBOutlet UIImageView *boatImage1;
    __weak IBOutlet UIImageView *boatImage2;
    __weak IBOutlet UIImageView *boatImage3;
    __weak IBOutlet UIImageView *boatImage4;
    
    IBOutlet UIButton *getDiplomaButton;
    IBOutlet UIButton *infoButton;
    IBOutlet UIButton *shareButton;
    
    IBOutlet UIView *infoScreen;
    IBOutlet UITextView *infoText;
    IBOutlet UIButton *resetButton;
    __weak IBOutlet UIButton *backButtonInfo;
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
    backButtonInfo.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:16];
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
    
    //FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    //playerData.name = @"It's me!";
    NSLog(@"View loaded");
    
    
    
}
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"View appear");
    [self setUpStartscreen];
}

- (void)setUpStartscreen {    
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    if (playerData.unlockedLevelTwo== YES) {
        [self unlockButtonTwo];
        [playButtonImage1 setHidden:YES];
        [islandImage2 setHidden:NO];
        if (playerData.pointsInLevel1 > 0)   {  [landmapImage1 setHidden:NO]; }
        if (playerData.pointsInLevel1 > 50)  {  [flagImage1 setHidden:NO]; }
        if (playerData.pointsInLevel1 > 100) {  [boatImage1 setHidden:NO]; }
        
    } else {
        [self resetButtonOne];
        [islandImage2 setHidden:YES];
        [landmapImage1 setHidden:YES];
        [flagImage1 setHidden:YES];
        [boatImage1 setHidden:YES];
    }
    
    if (playerData.unlockedLevelThree == YES) {
        [self unlockButtonThree];
        [playButtonImage2 setHidden:YES];
        [islandImage2 setHidden:NO];
        if (playerData.pointsInLevel2 > 0)   {  [landmapImage2 setHidden:NO]; }
        if (playerData.pointsInLevel2 > 50)  {  [flagImage2 setHidden:NO]; }
        if (playerData.pointsInLevel2 > 100) {  [boatImage2 setHidden:NO]; }
    } else {
        [self resetButtonTwo];
        [islandImage3 setHidden:YES];
        [landmapImage2 setHidden:YES];
        [flagImage2 setHidden:YES];
        [boatImage2 setHidden:YES];
    }
    
    if (playerData.unlockedLevelFour == YES) {
        [self unlockButtonFour];
        [playButtonImage3 setHidden:YES];
        [islandImage4 setHidden:NO];
        if (playerData.pointsInLevel3 > 0)   {  [landmapImage3 setHidden:NO]; }
        if (playerData.pointsInLevel3 > 50)  {  [flagImage3 setHidden:NO]; }
        if (playerData.pointsInLevel3 > 100) {  [boatImage3 setHidden:NO]; }
    } else {
        [self resetButtonThree];
        [islandImage4 setHidden:YES];
        [landmapImage3 setHidden:YES];
        [flagImage3 setHidden:YES];
        [boatImage3 setHidden:YES];
    }
    
    if (playerData.unlockedDiploma == YES) {
        [playButtonImage4 setHidden:YES];
        if (playerData.pointsInLevel4 > 0)   {  [landmapImage4 setHidden:NO]; }
        if (playerData.pointsInLevel4 > 50)  {  [flagImage4 setHidden:NO]; }
        if (playerData.pointsInLevel4 > 100) {  [boatImage4 setHidden:NO]; }
    } else {
        [self resetButtonFour];
        [landmapImage4 setHidden:YES];
        [flagImage4 setHidden:YES];
        [boatImage4 setHidden:YES];
        
    }

        
}
- (void)resetButtonOne {
    [playButtonImage1 setHidden:NO];
}
- (void)resetButtonTwo {
    [islandButton2 setImage:[UIImage imageNamed:@"main-level-closed.png"] forState:UIControlStateNormal];
    mainLabel2.translatesAutoresizingMaskIntoConstraints=YES;
    CGRect frameLabel = mainLabel2.frame;
    frameLabel.origin.y = 348;
    mainLabel2.frame = frameLabel;
    //[mainLabel2 setCenter:CGPointMake(384, 384)];
    [playButtonImage2 setHidden:YES];
}
- (void)resetButtonThree {
    [islandButton3 setImage:[UIImage imageNamed:@"main-level-closed.png"] forState:UIControlStateNormal];
    mainLabel3.translatesAutoresizingMaskIntoConstraints=YES;
    CGRect frameLabel = mainLabel3.frame;
    frameLabel.origin.y = 348;
    mainLabel3.frame = frameLabel;
    //[mainLabel3 setCenter:CGPointMake(638, 384)];
    [playButtonImage3 setHidden:YES];
}
- (void)resetButtonFour {
    [islandButton4 setImage:[UIImage imageNamed:@"main-level-closed.png"] forState:UIControlStateNormal];
    mainLabel4.translatesAutoresizingMaskIntoConstraints=YES;;
    CGRect frameLabel = mainLabel4.frame;
    frameLabel.origin.y = 348;
    mainLabel4.frame = frameLabel;
    //[mainLabel4 setCenter:CGPointMake(886, 384)];
    [playButtonImage4 setHidden:YES];
}


- (void)unlockButtonTwo {
    [islandButton2 setImage:[UIImage imageNamed:@"main-level-bg.png"] forState:UIControlStateNormal];
    [islandButton2 setEnabled:YES];
    
    mainLabel2.translatesAutoresizingMaskIntoConstraints=YES;
    CGRect frameLabel = mainLabel2.frame;
    frameLabel.origin.y = 200;
    mainLabel2.frame = frameLabel;
    //[mainLabel2 setCenter:CGPointMake(384, 236)];
    [playButtonImage2 setHidden:NO];
}
- (void)unlockButtonThree {
    [islandButton3 setImage:[UIImage imageNamed:@"main-level-bg.png"] forState:UIControlStateNormal];
    [islandButton3 setEnabled:YES];
    
    mainLabel3.translatesAutoresizingMaskIntoConstraints=YES;
    CGRect frameLabel = mainLabel3.frame;
    frameLabel.origin.y = 200;
    mainLabel3.frame = frameLabel;
    //[mainLabel3 setCenter:CGPointMake(638, 236)];
    [playButtonImage3 setHidden:NO];
}
- (void)unlockButtonFour {
    [islandButton4 setImage:[UIImage imageNamed:@"main-level-bg.png"] forState:UIControlStateNormal];
    [islandButton4 setEnabled:YES];
    
    mainLabel4.translatesAutoresizingMaskIntoConstraints=YES;
    CGRect frameLabel = mainLabel4.frame;
    frameLabel.origin.y = 200;
    mainLabel4.frame = frameLabel;
    //[mainLabel4 setCenter:CGPointMake(886, 236)];
    [playButtonImage4 setHidden:NO];
    NSLog(@"label moved");
}



#pragma mark - Info Screen & Game reset

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
    [self hideScreen];
}
- (void)hideScreen
{
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [infoScreen setAlpha:0.0f];
                     }
                     completion:^(BOOL finished) {
                         infoScreen.hidden = YES;
                     }];
}

- (IBAction)resetGame:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Really reset?" message:@"Do you really want to reset this game?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Reset"];
    [alert setTag:12];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if ([alertView tag] == 12) {    
        if (buttonIndex == 1) {    
            FFAPlayer *playerData = [FFAPlayer sharedPlayer];
            playerData.name = @"";
            playerData.gender = UnKnown;
            playerData.age = 0;
            playerData.unlockedLevelTwo = NO;
            playerData.unlockedLevelThree = NO;
            playerData.unlockedLevelFour = NO;
            playerData.unlockedDiploma = NO;
            playerData.currentQuestion = 0;
            playerData.pointsInLevel1 = 0;
            playerData.pointsInLevel2 = 0;
            playerData.pointsInLevel3 = 0;
            playerData.pointsInLevel4 = 0;
            playerData.boatPosX = 0.0;
            playerData.boatPosY = 0.0;
            CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
            NSString * uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
            CFRelease(newUniqueId);
            playerData.deviceID = uuidString;
            [playerData.answerValues removeAllObjects];
            [self setUpStartscreen];
            
            [self hideScreen];
        }
    }
}


#pragma mark - App Sharing

- (IBAction)shareApp:(id)sender
{
    if ([self.activityPopoverController isPopoverVisible]) {
        [self.activityPopoverController dismissPopoverAnimated:YES];
    } else {
       /* NSString *shareText = [NSString stringWithFormat:@"Prove yourself with Coco"];
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
        */
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sharing Disabled" message:@"Sharing has been disabled for Demo purposes. Sorry." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    
    if ([segue.identifier isEqualToString:@"showDiplomaScreen"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Diploma in demo mode" message:@"The diploma would be disabled until all islands are finished. Here's a sample how it could look like." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
