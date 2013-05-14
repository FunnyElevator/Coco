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
@property (strong) NSString *tip;

@end
