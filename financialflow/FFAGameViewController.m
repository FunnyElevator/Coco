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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    questionCatLabel.font = [UIFont fontWithName:@"Trade Winds" size:20];
    questionTextLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:13];
    
    answer1Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:18];
    answer2Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:18];
    answer3Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:18];
    answer4Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:18];
    answer5Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:18];
    menuButton.titleLabel.font = [UIFont fontWithName:@"Trade Winds" size:18];
    continueButton.titleLabel.font = [UIFont fontWithName:@"Trade Winds" size:20];
    
    answer1Button.titleLabel.text = @"Hello";
    
    self.questionaireData = [NSMutableArray array];
    
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"questions_data" ofType:@"json"];
    NSError *error = nil;
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    NSDictionary* questionJSDataRaw = [NSJSONSerialization
                               JSONObjectWithData:JSONData
                               options:kNilOptions
                               error:&error];
    NSArray *questionJSData = [questionJSDataRaw valueForKeyPath:@"questionsData"];
    
    //NSLog(@"data: %@", questionJSData);
    //NSLog(@"data count: %lu", (unsigned long)[questionJSData count]);
    
    for (int i = 0; i < [questionJSData count]; i++) {
        NSDictionary* singleQuestion = [questionJSData objectAtIndex:i];
        
        NSString *questionText = [singleQuestion objectForKey:@"question"];
        NSNumber *idOfQ = [singleQuestion objectForKey:@"id"];
        NSNumber *categoryID = [singleQuestion objectForKey:@"category_id"];
        NSString *answer1TextQ = [singleQuestion objectForKey:@"answer1_text"];
        NSNumber *answer1ValueQ = [singleQuestion objectForKey:@"answer1_value"];
        NSString *answer2TextQ = [singleQuestion objectForKey:@"answer2_text"];
        NSNumber *answer2ValueQ = [singleQuestion objectForKey:@"answer2_value"];
        NSString *answer3TextQ = [singleQuestion objectForKey:@"answer3_text"];
        NSNumber *answer3ValueQ = [singleQuestion objectForKey:@"answer3_value"];
        NSString *answer4TextQ = [singleQuestion objectForKey:@"answer4_text"];
        NSNumber *answer4ValueQ = [singleQuestion objectForKey:@"answer4_value"];
        NSString *answer5TextQ = [singleQuestion objectForKey:@"answer5_text"];
        NSNumber *answer5ValueQ = [singleQuestion objectForKey:@"answer5_value"];
        NSString *tip = [singleQuestion objectForKey:@"tip"];

        NSLog(@"Event tags: %@", idOfQ);
        FFAQuestionData *newQuestion = [FFAQuestionData questionWithText:questionText
                                                                   idofQ:idOfQ
                                                              categoryID:categoryID
                                                             answer1Text:answer1TextQ
                                                            answer1Value:answer1ValueQ
                                                             answer2Text:answer2TextQ
                                                            answer2Value:answer2ValueQ
                                                             answer3Text:answer3TextQ
                                                            answer3Value:answer3ValueQ
                                                             answer4Text:answer4TextQ
                                                            answer4Value:answer4ValueQ
                                                             answer5Text:answer5TextQ
                                                            answer5Value:answer5ValueQ
                                                                 andATip:tip];
        [self.questionaireData addObject:newQuestion];
        //NSLog(@"Event added with ID: %@",newEvent.idNumber);
     
    }
    
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    
    //NSLog(@"Playername: %@", playerData.name);
    
    if (playerData.currentQuestion < 100) {
        [self showComicstrip];
    } else {
        [self showQuestion];
    }
    [self setupGameField];
}

- (void)showComicstrip {
    comicButton.titleLabel.font = [UIFont fontWithName:@"Trade Winds" size:24];
    [comicView setHidden:NO];
    [UIImageView animateWithDuration:0.5f
                               delay:0.5f
                             options:UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              [comicImg1 setAlpha:1.0f];
                          }
                          completion:nil];
    [UIImageView animateWithDuration:0.5f
                               delay:1.5f
                             options:UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              [comicImg2 setAlpha:1.0f];
                          }
                          completion:nil];
    [UIImageView animateWithDuration:0.5f
                               delay:2.5f
                             options:UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              [comicImg3 setAlpha:1.0f];
                          }
                          completion:nil];
    [UIImageView animateWithDuration:0.5f
                               delay:3.5f
                             options:UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              [comicImg4 setAlpha:1.0f];
                          }
                          completion:nil];
    [UIImageView animateWithDuration:0.5f
                               delay:4.5f
                             options:UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              [comicImg5 setAlpha:1.0f];
                          }
                          completion:nil];
    [UIButton animateWithDuration:0.5f
                            delay:5.5f
                          options:UIViewAnimationOptionCurveEaseInOut
                          animations:^{
                              [comicButton setAlpha:1.0f];
                              [comicButton setEnabled:YES];
                          }
                          completion:nil];
}

- (IBAction)finishComic:(id)sender {
    //[comicView setHidden:YES];
    [UIView animateWithDuration:0.5f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [comicView setAlpha:0.0f];
                     }
                     completion:^(BOOL finished){
                         [comicView setHidden:YES];
                         [comicView setAlpha:1.0f];
                         [comicImg1 setAlpha:0.0f];
                         [comicImg2 setAlpha:0.0f];
                         [comicImg3 setAlpha:0.0f];
                         [comicImg4 setAlpha:0.0f];
                         [comicImg5 setAlpha:0.0f];
                         [comicButton setAlpha:0.0f];
                         [comicButton setEnabled:NO];
                     }];
    [self showQuestion];                         
    
    
    
}
- (void)setupGameField {
    int i=0;
    if (i<100) {
        [portImage setImage:[UIImage imageNamed:@"port1.png"]];
        [islandImage setImage:[UIImage imageNamed:@"island1.png"]];
        questionCatLabel.text = @"<#string#>";
    }
}

- (void)showQuestion {
    [self enableAllButtons];
    
}

- (void)questionAnswered {
    
}
- (IBAction)continueAfterQuestion:(id)sender {
 
}

- (void)disableAllButtons {
    answer1Button.enabled = NO;
    answer2Button.enabled = NO;
    answer3Button.enabled = NO;
    answer4Button.enabled = NO;
    answer5Button.enabled = NO;
}

- (void)enableAllButtons {
    answer1Button.enabled = YES;
    answer2Button.enabled = YES;
    answer3Button.enabled = YES;
    answer4Button.enabled = YES;
    answer5Button.enabled = YES;
}

+(NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - question answering





@end
