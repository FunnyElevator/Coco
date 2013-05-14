//
//  FFAQuestionData.h
//  financialflow
//
//  Created by Fabian on 14.05.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFAQuestionData : NSObject

@property (strong) NSString *question;
@property (strong) NSNumber *idNumber;
@property (strong) NSNumber *idCategory;
@property (strong) NSString *answer1Text;
@property (strong) NSNumber *answer1Value;
@property (strong) NSString *answer2Text;
@property (strong) NSNumber *answer2Value;
@property (strong) NSString *answer3Text;
@property (strong) NSNumber *answer3Value;
@property (strong) NSString *answer4Text;
@property (strong) NSNumber *answer4Value;
@property (strong) NSString *answer5Text;
@property (strong) NSNumber *answer5Value;
@property (strong) NSString *tip;

+ (id) questionWithText:(NSString*)inQuestionText idofQ:(NSNumber*)inQID categoryID:(NSNumber*)inCatID answer1Text:(NSString*)inAnswer1Text answer1Value:(NSNumber*)inAnswer1Value answer2Text:(NSString*)inAnswer2Text answer2Value:(NSNumber*)inAnswer2Value answer3Text:(NSString*)inAnswer3Text answer3Value:(NSNumber*)inAnswer3Value answer4Text:(NSString*)inAnswer4Text answer4Value:(NSNumber*)inAnswer4Value answer5Text:(NSString*)inAnswer5Text answer5Value:(NSNumber*)inAnswer5Value andATip:(NSString*)inTip;

@end
