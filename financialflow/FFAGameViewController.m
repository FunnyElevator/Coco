//
//  FFAGameViewController.m
//  financialflow
//
//  Created by Fabian on 09.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import "FFAGameViewController.h"

@interface FFAGameViewController ()

    @property (weak, nonatomic) IBOutlet UIButton *mapPointButton1;
    @property (weak, nonatomic) IBOutlet UIButton *mapPointButton2;
    @property (weak, nonatomic) IBOutlet UIButton *mapPointButton3;
    @property (weak, nonatomic) IBOutlet UIButton *mapPointButton4;
    @property (weak, nonatomic) IBOutlet UIButton *mapPointButton5;
    @property (weak, nonatomic) IBOutlet UIButton *mapPointButton6;
    @property (weak, nonatomic) IBOutlet UIButton *mapPointButton7;

@property (weak, nonatomic) IBOutlet UIImageView *mapLine1;
@property (weak, nonatomic) IBOutlet UIImageView *mapLine2;
@property (weak, nonatomic) IBOutlet UIImageView *mapLine3;
@property (weak, nonatomic) IBOutlet UIImageView *mapLine4;
@property (weak, nonatomic) IBOutlet UIImageView *mapLine5;
@property (weak, nonatomic) IBOutlet UIImageView *mapLine6;
    
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
    self.markerButtons = [NSMutableArray array];
    [self.markerButtons addObject:self.mapPointButton1];
    [self.markerButtons addObject:self.mapPointButton2];
    [self.markerButtons addObject:self.mapPointButton3];
    [self.markerButtons addObject:self.mapPointButton4];
    [self.markerButtons addObject:self.mapPointButton5];
    [self.markerButtons addObject:self.mapPointButton6];
    [self.markerButtons addObject:self.mapPointButton7];

    
    NSLog(@"MarkerArray count 1: %lu ", (unsigned long)[self.markerButtons count]);
    
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
/*
+(NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}
*/

#pragma mark - Comic functions

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

#pragma mark - Game field setup

- (void)setupGameField {
    [questionsView setHidden: NO];
    [self disableMapPoints];
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    
    //[boatView setCenter:CGPointMake(playerData.boatPosX, playerData.boatPosY)];
    
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

- (IBAction)answeredN1:(id)sender {
    [self questionAnsweredNumber:1 andQuestionValue:self.currentQData.answer1Value];
    
    if ([self.currentQData.answer1Value intValue] < 10) {
        [answer1Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)answeredN2:(id)sender {
    [self questionAnsweredNumber:2 andQuestionValue:self.currentQData.answer2Value];
    if ([self.currentQData.answer2Value intValue] < 10) {
        [answer2Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)answeredN3:(id)sender {
    [self questionAnsweredNumber:3 andQuestionValue:self.currentQData.answer3Value];
    if ([self.currentQData.answer3Value intValue] < 10) {
        [answer3Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)answeredN4:(id)sender {
    [self questionAnsweredNumber:4 andQuestionValue:self.currentQData.answer4Value];
    if ([self.currentQData.answer4Value intValue] < 10) {
        [answer4Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)answeredN5:(id)sender {
    [self questionAnsweredNumber:5 andQuestionValue:self.currentQData.answer5Value];
    if ([self.currentQData.answer5Value intValue] < 10) {
        [answer5Button setBackgroundImage:[UIImage imageNamed:@"answer-wrong-button.png"] forState:UIControlStateNormal];
    }
}





- (void)showQuestion {
    [self enableAllButtons];
    badgeRightImg.hidden = YES;
    badgeWrongImg.hidden = YES;
    continueButton.hidden = YES;
    tipsView.translatesAutoresizingMaskIntoConstraints=YES;
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [tipsView setCenter:CGPointMake(132, 888)];
                         [tipsView setAlpha:0.0f];
                     }];
    tipsTextLabel.translatesAutoresizingMaskIntoConstraints = YES;
    CGRect frameLabel2 = tipsTextLabel.frame;
    frameLabel2.size.height = 118;
    tipsTextLabel.frame = frameLabel2;
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

- (void)questionAnsweredNumber:(int)answerNumber andQuestionValue:(NSNumber *)questionValue{
    [self disableAllButtons];
    continueButton.hidden = NO;
    FFAPlayer *playerData = [FFAPlayer sharedPlayer];
    
    // show tips
    if ([self.currentQData.tip isEqualToString:@""]) {
        // do nothing
    } else {
        if ([self.currentQData.answer5Text isEqualToString:@""]) {
            tipsTextLabel.translatesAutoresizingMaskIntoConstraints = YES;
            CGRect frameLabel2 = tipsTextLabel.frame;
            frameLabel2.size.height += 90;
            tipsTextLabel.frame = frameLabel2;
            [UIView animateWithDuration:0.5f
                             animations:^{
                                 tipsView.translatesAutoresizingMaskIntoConstraints = YES;
                                 [tipsView setCenter:CGPointMake(132, 628)];
                                 [tipsView setAlpha:1.0f];
                             }];
            NSLog(@"TipsView Y Pos: %f", tipsView.frame.origin.y);
        } else {
            [UIView animateWithDuration:0.5f
                             animations:^{
                                 tipsView.translatesAutoresizingMaskIntoConstraints = YES;
                                 [tipsView setCenter:CGPointMake(132, 718)];
                                 [tipsView setAlpha:1.0f];
                             }];
        }
    }
    
    // move the boat
    self.boatPosition += 70;
    [UIImageView animateWithDuration:1.0f
                     animations:^{
                         CGFloat tempBoatYchange = ([questionValue floatValue]*3)-30.0;
                         NSLog(@"boatMovement: %f", tempBoatYchange);
                         
                         [boatView setCenter:CGPointMake(self.boatPosition, boatView.center.y-tempBoatYchange)];
                         
                         playerData.boatPosX = boatView.center.x;
                         playerData.boatPosY = boatView.center.y;
                     }];
    
    // colorize buttons
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
    
    
    
    // draw map buttons
    int tempQuestionID = [self.currentQData.idNumber intValue]-(100*[self.currentQData.idCategory intValue]);
    
    [[self.markerButtons objectAtIndex:tempQuestionID] setCenter:CGPointMake(85*(tempQuestionID+1), playerData.boatPosY+70)];
    [UIButton animateWithDuration:0.5f
                       animations:^{
                           [[self.markerButtons objectAtIndex:tempQuestionID] setAlpha:1.0f];
                       }];
    
    [[self.markerButtons objectAtIndex:tempQuestionID] setAlpha:1.0f];
    
        
    // calculate game&level points
    if (answerNumber == 1) {
        if ([self.currentQData.idCategory intValue] == 1) {
            playerData.pointsInLevel1 += [self.currentQData.answer1Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 2) {
            playerData.pointsInLevel2 += [self.currentQData.answer1Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 3) {
            playerData.pointsInLevel3 += [self.currentQData.answer1Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 4) {
            playerData.pointsInLevel4 += [self.currentQData.answer1Value intValue];
        }
    }  else if (answerNumber == 2) {
        if ([self.currentQData.idCategory intValue] == 1) {
            playerData.pointsInLevel1 += [self.currentQData.answer2Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 2) {
            playerData.pointsInLevel2 += [self.currentQData.answer2Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 3) {
            playerData.pointsInLevel3 += [self.currentQData.answer2Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 4) {
            playerData.pointsInLevel4 += [self.currentQData.answer2Value intValue];
        }
    } else if (answerNumber == 3) {
        if ([self.currentQData.idCategory intValue] == 1) {
            playerData.pointsInLevel1 += [self.currentQData.answer3Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 2) {
            playerData.pointsInLevel2 += [self.currentQData.answer3Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 3) {
            playerData.pointsInLevel3 += [self.currentQData.answer3Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 4) {
            playerData.pointsInLevel4 += [self.currentQData.answer3Value intValue];
        }
    } else if (answerNumber == 4) {
        if ([self.currentQData.idCategory intValue] == 1) {
            playerData.pointsInLevel1 += [self.currentQData.answer4Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 2) {
            playerData.pointsInLevel2 += [self.currentQData.answer4Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 3) {
            playerData.pointsInLevel3 += [self.currentQData.answer4Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 4) {
            playerData.pointsInLevel4 += [self.currentQData.answer4Value intValue];
        }
    } else if (answerNumber == 5) {
        if ([self.currentQData.idCategory intValue] == 1) {
            playerData.pointsInLevel1 += [self.currentQData.answer5Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 2) {
            playerData.pointsInLevel2 += [self.currentQData.answer5Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 3) {
            playerData.pointsInLevel3 += [self.currentQData.answer5Value intValue];
        } else if ([self.currentQData.idCategory intValue] == 4) {
            playerData.pointsInLevel4 += [self.currentQData.answer5Value intValue];
        }
    }
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
- (void)disableMapPoints {
    self.mapPointButton1.enabled = NO;
    self.mapPointButton2.enabled = NO;
    self.mapPointButton3.enabled = NO;
    self.mapPointButton4.enabled = NO;
    self.mapPointButton5.enabled = NO;
    self.mapPointButton6.enabled = NO;
    self.mapPointButton7.enabled = NO;
    //self.mapPointButton1.alpha = 0.0f;
    self.mapPointButton2.alpha = 0.0f;
    self.mapPointButton3.alpha = 0.0f;
    self.mapPointButton4.alpha = 0.0f;
    self.mapPointButton5.alpha = 0.0f;
    self.mapPointButton6.alpha = 0.0f;
    self.mapPointButton7.alpha = 0.0f;
    
    self.mapLine1.alpha = 0.0f;
    self.mapLine2.alpha = 0.0f;
    self.mapLine3.alpha = 0.0f;
    self.mapLine4.alpha = 0.0f;
    self.mapLine5.alpha = 0.0f;
    self.mapLine6.alpha = 0.0f;
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





#pragma mark - question answering

#pragma mark - Quit game

- (IBAction)closeGameField:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
