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
    NSString *_name;
    int _age;
    PLGender _gender;
    bool _unlockedLevelTwo;
    bool _unlockedLevelThree;
    bool _unlockedLevelFour;
    int _currentQuestion;
    NSMutableArray *_answerValues;
    NSString *_deviceID;
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

- (id)initWithDeviceID:(NSString *)deviceID;
//- (void)firstIslandFinished:(int)islandNumberFinished;
- (void)setGender:(PLGender)gender;
- (void)setAge:(int)age;
- (void)setCurrentQuestion:(int)currentQuestion;
- (void)setName:(NSString *)name;
- (void)addAnswerValuesObject:(NSString *)answerValue;


@end
