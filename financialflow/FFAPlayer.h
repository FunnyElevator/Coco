//
//  FFAPlayer.h
//  financialflow
//
//  Created by Fabian on 18.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GenderMale,
    GenderFemale,
    UnKnown
} PLGender;


@interface FFAPlayer : NSObject {
    NSString *name;
    int age;
    PLGender gender;
    bool unlockedLevelTwo;
    bool unlockedLevelThree;
    bool unlockedLevelFour;
    int currentQuestion;
    NSMutableArray *answerValues;
    NSString *deviceID;
}

@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) PLGender gender;
@property (nonatomic, readwrite) bool unlockedLevelTwo;
@property (nonatomic, readwrite) bool unlockedLevelThree;
@property (nonatomic, readwrite) bool unlockedLevelFour;
@property (nonatomic, readwrite) int currentQuestion;
@property (nonatomic, readwrite) NSMutableArray *answerValues;
@property (nonatomic, readwrite) NSString *deviceID;


+ (id)sharedPlayer;

@end
