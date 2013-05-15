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
}
@property (nonatomic, strong) UIPopoverController *activityPopoverController;

@end

static FFAStartViewController *playerData;

@implementation FFAStartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // Addust fonts and set up view
    getDiplomaButton.titleLabel.font = [UIFont fontWithName:@"Trade Winds" size:24];
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
    /*
    CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
    NSString * uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
    CFRelease(newUniqueId);
    
    NSLog(@"UUIDthing: %@", uuidString);
     
     */
    
    FFAPlayer *playerdata = [FFAPlayer sharedPlayer];
    
    playerdata.name = @"hello";
}
+ (FFAStartViewController *) sharedInstance
{
    if( playerData == nil)
    {
        playerData = [[FFAStartViewController alloc]init];
    }
    
    return playerData;
    
}
- (IBAction)resetGame:(id)sender {
    NSLog(@"resetGamw");
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
