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
    bool unlockedDiploma;
    int currentQuestion;
    int pointsInLevel1;
    int pointsInLevel2;
    int pointsInLevel3;
    int pointsInLevel4;
    NSMutableArray *answerValues;
    NSString *deviceID;
}

@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) int age;
@property (nonatomic, readwrite) PLGender gender;
@property (nonatomic, readwrite) bool unlockedLevelTwo;
@property (nonatomic, readwrite) bool unlockedLevelThree;
@property (nonatomic, readwrite) bool unlockedLevelFour;
@property (nonatomic, readwrite) bool unlockedDiploma;
@property (nonatomic, readwrite) int currentQuestion;
@property (nonatomic, readwrite) int pointsInLevel1;
@property (nonatomic, readwrite) int pointsInLevel2;
@property (nonatomic, readwrite) int pointsInLevel3;
@property (nonatomic, readwrite) int pointsInLevel4;
@property (nonatomic, readwrite) CGFloat boatPosX;
@property (nonatomic, readwrite) CGFloat boatPosY;
@property (nonatomic, readwrite) NSMutableArray *answerValues;
@property (nonatomic, readwrite) NSString *deviceID;


+ (id)sharedPlayer;

@end
