//
//  FFAGameViewController.h
//  financialflow
//
//  Created by Fabian on 09.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFAPlayer.h"
#import "FFAQuestionData.h"

@interface FFAGameViewController : UIViewController {
    IBOutlet UIView *questionsView;
    IBOutlet UILabel *questionCatLabel;
    IBOutlet UITextView *questionTextLabel;
    IBOutlet UIButton *answer1Button;
    IBOutlet UIButton *answer2Button;
    IBOutlet UIButton *answer3Button;
    IBOutlet UIButton *answer4Button;
    IBOutlet UIButton *answer5Button;
    
    IBOutlet UIButton *continueButton;
    IBOutlet UITextView *tipsTextLabel;
    IBOutlet UIView *tipsView;
    IBOutlet UIView *mainView;
    
    __weak IBOutlet UIImageView *islandImage;
    __weak IBOutlet UIImageView *portImage;
    __weak IBOutlet UIButton *menuButton;
    
    __weak IBOutlet UIView *comicView;
    __weak IBOutlet UIImageView *comicImg1;
    __weak IBOutlet UIImageView *comicImg2;
    __weak IBOutlet UIImageView *comicImg3;
    __weak IBOutlet UIImageView *comicImg4;
    __weak IBOutlet UIImageView *comicImg5;
    __weak IBOutlet UIButton *comicButton;
    
    
}

@property (strong) NSMutableArray *questionaireData;

- (IBAction)continueAfterQuestion:(id)sender;
- (IBAction)finishComic:(id)sender;

@end
