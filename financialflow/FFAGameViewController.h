//
//  FFAGameViewController.h
//  financialflow
//
//  Created by Fabian on 09.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFAPlayer.h"

@interface FFAGameViewController : UIViewController {
    IBOutlet UIView *questionsView;
    IBOutlet UILabel *questionTitleLabel;
    IBOutlet UIButton *answer1Button;
    IBOutlet UIButton *answer2Button;
    IBOutlet UIButton *answer3Button;
    IBOutlet UIButton *answer4Button;
    
    IBOutlet UIButton *continueButton;
    IBOutlet UILabel *tipsTextLabel;
    IBOutlet UIView *tipsView;
    IBOutlet UIView *mainView;
}

@property (strong) NSMutableArray *questionaireData;

- (IBAction)continueAfterQuestion:(id)sender;

@end
