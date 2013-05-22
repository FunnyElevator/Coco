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
    questionTextLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:14];
    
    answer1Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:14];
    answer2Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:14];
    answer3Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:14];
    answer4Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:14];
    answer5Button.titleLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:14];
    
    
    answer1Button.titleLabel.textAlignment = NSTextAlignmentCenter;
    answer2Button.titleLabel.textAlignment = NSTextAlignmentCenter;
    answer3Button.titleLabel.textAlignment = NSTextAlignmentCenter;
    answer4Button.titleLabel.textAlignment = NSTextAlignmentCenter;
    answer5Button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    menuButton.titleLabel.font = [UIFont fontWithName:@"Trade Winds" size:18];
    continueButton.titleLabel.font = [UIFont fontWithName:@"Trade Winds" size:20];
    
    answer1Button.titleLabel.text = @"Hello";
    
    self.questionaireData = [NSMutableArray array];
    self.boatPosition = 180;
    
    
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

        //NSLog(@"Event tags: %@", idOfQ);
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
        //NSLog(@"Event added with ID: %@",newQuestion.idNumber);
     
    }
    //NSLog(@"QData count: %lu", (unsigned long)[self.questionaireData count]);
    
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    
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
                             
    
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    playerData.currentQuestion = 101;
    //NSLog(@"plD1: %@", [NSNumber numberWithInt:playerData.currentQuestion]);

    [self showQuestion];
}

- (IBAction)answeredN1:(id)sender {
    [self questionAnsweredNumber:1];
    
    if ([self.currentQData.answer1Value intValue] < 10) {
        [answer1Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)answeredN2:(id)sender {
    [self questionAnsweredNumber:2];
    if ([self.currentQData.answer2Value intValue] < 10) {
        [answer2Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)answeredN3:(id)sender {
    [self questionAnsweredNumber:3];
    if ([self.currentQData.answer3Value intValue] < 10) {
        [answer3Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)answeredN4:(id)sender {
    [self questionAnsweredNumber:4];
    if ([self.currentQData.answer4Value intValue] < 10) {
        [answer4Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)answeredN5:(id)sender {
    [self questionAnsweredNumber:5];
    if ([self.currentQData.answer5Value intValue] < 10) {
        [answer5Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}

- (void)setupGameField {
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    
    if (playerData.currentQuestion<200) {
        [portImage setImage:[UIImage imageNamed:@"port1.png"]];
        [islandImage setImage:[UIImage imageNamed:@"island1.png"]];
        questionCatLabel.text = @"OPI PERUSTEET";
    } else if (playerData.currentQuestion<300) {
        [portImage setImage:[UIImage imageNamed:@"port2.png"]];
        [islandImage setImage:[UIImage imageNamed:@"island2.png"]];
        questionCatLabel.text = @"Kierrä karikot";
    }
}

- (void)showQuestion {
    [self enableAllButtons];
    badgeRightImg.hidden = YES;
    badgeWrongImg.hidden = YES;
    continueButton.hidden = YES;
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [tipsView setCenter:CGPointMake(132, 888)];
                         [tipsView setAlpha:0.0f];
                     }];
    
    tipsTextLabel.font = [UIFont fontWithName:@"ArbutusSlab-Regular" size:14];
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    for (int i=0; i< self.questionaireData.count; i++) {
        FFAQuestionData *currentArrayQuestion = [self.questionaireData objectAtIndex:i];
        if ([currentArrayQuestion.idNumber intValue] == playerData.currentQuestion ) {
            //NSLog(@"I found something");
            self.currentQData = currentArrayQuestion;
            
        }
    }
    NSLog(@"Current QData.number %@", self.currentQData.idNumber);
    
    if ([self.currentQData.answer5Text isEqualToString:@""]) {
        answer5Button.hidden = YES;
    } else {
        answer5Button.hidden = NO;
    }
    if ([self.currentQData.answer4Text isEqualToString:@""]) {
        answer4Button.hidden = YES;
    } else {
        answer4Button.hidden = NO;
    }
    [answer1Button setTitle:self.currentQData.answer1Text forState:UIControlStateNormal];
    [answer2Button setTitle:self.currentQData.answer2Text forState:UIControlStateNormal];
    [answer3Button setTitle:self.currentQData.answer3Text forState:UIControlStateNormal];
    [answer4Button setTitle:self.currentQData.answer4Text forState:UIControlStateNormal];
    [answer5Button setTitle:self.currentQData.answer5Text forState:UIControlStateNormal];
    
    tipsTextLabel.text = self.currentQData.tip;
    questionTextLabel.text = self.currentQData.question;
    NSLog(@"self.currentQData.answer1Text: %@", self.currentQData.answer1Text);

}

- (void)questionAnsweredNumber:(int)answerNumber {
    [self disableAllButtons];
    continueButton.hidden = NO;
    if ([self.currentQData.answer5Text isEqualToString:@""]) {
        [UIView animateWithDuration:0.5f
                         animations:^{
                             [tipsView setCenter:CGPointMake(132, 628)];
                             [tipsView setAlpha:1.0f];
                         }];
    } else {
        [UIView animateWithDuration:0.5f
                         animations:^{
                             [tipsView setCenter:CGPointMake(132, 718)];
                             [tipsView setAlpha:1.0f];
                         }];
    }
    self.boatPosition += 80;
    [UIImageView animateWithDuration:1.0f
                     animations:^{
                         [boatView setCenter:CGPointMake(self.boatPosition, 374)];
                     }];
    if ([self.currentQData.answer1Value intValue] == 20) {
        [answer1Button setBackgroundImage:[UIImage imageNamed:@"answer-right-button.png"] forState:UIControlStateNormal];
    }
    if ([self.currentQData.answer2Value intValue] == 20) {
        [answer2Button setBackgroundImage:[UIImage imageNamed:@"answer-right-button.png"] forState:UIControlStateNormal];
    }
    if ([self.currentQData.answer3Value intValue] == 20) {
        [answer3Button setBackgroundImage:[UIImage imageNamed:@"answer-right-button.png"] forState:UIControlStateNormal];
    }
    if ([self.currentQData.answer4Value intValue] == 20) {
        [answer4Button setBackgroundImage:[UIImage imageNamed:@"answer-right-button.png"] forState:UIControlStateNormal];
    }
    if ([self.currentQData.answer5Value intValue] == 20) {
        [answer5Button setBackgroundImage:[UIImage imageNamed:@"answer-right-button.png"] forState:UIControlStateNormal];
    }
    
    // show result
    //animate Screen
}

- (IBAction)continueAfterQuestion:(id)sender {
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    
    if (playerData.currentQuestion == 106 || playerData.currentQuestion == 206 || playerData.currentQuestion == 306 || playerData.currentQuestion == 406) {
        [self showResultScreen];
    } else {
        playerData.currentQuestion += 1;
        [self showQuestion];
    }
    
}

- (void)showResultScreen {
    
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
    
    [answer1Button setBackgroundImage:[UIImage imageNamed:@"answer-button-normal.png"] forState:UIControlStateNormal];
    [answer2Button setBackgroundImage:[UIImage imageNamed:@"answer-button-normal.png"] forState:UIControlStateNormal];
    [answer3Button setBackgroundImage:[UIImage imageNamed:@"answer-button-normal.png"] forState:UIControlStateNormal];
    [answer4Button setBackgroundImage:[UIImage imageNamed:@"answer-button-normal.png"] forState:UIControlStateNormal];
    [answer5Button setBackgroundImage:[UIImage imageNamed:@"answer-button-normal.png"] forState:UIControlStateNormal];
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
