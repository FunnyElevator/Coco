//
//  FFAQuestionData.m
//  financialflow
//
//  Created by Fabian on 14.05.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import "FFAQuestionData.h"

@implementation FFAQuestionData

+ (id) questionWithText:(NSString*)inQuestionText idofQ:(NSNumber*)inQID categoryID:(NSNumber*)inCatID answer1Text:(NSString*)inAnswer1Text answer1Value:(NSNumber*)inAnswer1Value answer2Text:(NSString*)inAnswer2Text answer2Value:(NSNumber*)inAnswer2Value answer3Text:(NSString*)inAnswer3Text answer3Value:(NSNumber*)inAnswer3Value answer4Text:(NSString*)inAnswer4Text answer4Value:(NSNumber*)inAnswer4Value answer5Text:(NSString*)inAnswer5Text answer5Value:(NSNumber*)inAnswer5Value andATip:(NSString*)inTip
{
    FFAQuestionData *singleQuestion = [[FFAQuestionData alloc] init];
    
    singleQuestion.question = inQuestionText;
    singleQuestion.idNumber = inQID;
    singleQuestion.idCategory = inCatID;
    singleQuestion.answer1Text = inAnswer1Text;
    singleQuestion.answer1Value = inAnswer1Value;
    singleQuestion.answer1Text = inAnswer2Text;
    singleQuestion.answer1Value = inAnswer2Value;
    singleQuestion.answer1Text = inAnswer3Text;
    singleQuestion.answer1Value = inAnswer3Value;
    singleQuestion.answer1Text = inAnswer4Text;
    singleQuestion.answer1Value = inAnswer4Value;
    singleQuestion.answer1Text = inAnswer5Text;
    singleQuestion.answer1Value = inAnswer5Value;
    singleQuestion.tip = inTip;
   
    return singleQuestion;
}

@end
