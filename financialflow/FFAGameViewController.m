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
}

+(NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    // Be careful here. You add this as a category to NSDictionary
    // but you get an id back, which means that result
    // might be an NSArray as well!
    if (error != nil) return nil;
    return result;
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
