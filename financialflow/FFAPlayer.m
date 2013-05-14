//
//  FFAPlayer.m
//  financialflow
//
//  Created by Fabian on 18.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import "FFAPlayer.h"

@implementation FFAPlayer

@synthesize name = _name;
@synthesize age = _age;
@synthesize gender = _gender;
@synthesize unlockedLevelTwo = _unlockedLevelTwo;
@synthesize unlockedLevelThree = _unlockedLevelThree;
@synthesize unlockedLevelFour = _unlockedLevelFour;
@synthesize currentQuestion = _currentQuestion;
@synthesize answerValues = _answerValues;
@synthesize deviceID = _deviceID;

- (id)initWithDeviceID:(NSString *)deviceID {
      
    FFAPlayer *ffaPlayer = [[FFAPlayer alloc] init];
    
    ffaPlayer.name = @"";
    ffaPlayer.age = 0;
    ffaPlayer.gender = UnKnown;
    ffaPlayer.unlockedLevelTwo = NO;
    ffaPlayer.unlockedLevelThree = NO;
    ffaPlayer.unlockedLevelFour = NO;
    ffaPlayer.currentQuestion = 0;
    //self.answerValues = [NSMutableArray initialize];
    ffaPlayer.deviceID = deviceID;
    
    
    return self;
}
/*
- (void)firstIslandFinished:(int)islandNumberFinished {
    if (islandNumberFinished == 1) {
        self.unlockedLevelTwo = YES;
    } else if (islandNumberFinished == 2) {
        self.unlockedLevelThree = YES;
    } else if (islandNumberFinished == 3) {
        self.unlockedLevelFour = YES;
    }
    
}
 */
- (void)setGender:(PLGender)gender{
    
}
- (void)setAge:(int)age{
    
}
- (void)setCurrentQuestion:(int)currentQuestion{
    
}
- (void)setName:(NSString *)name{
    
}
- (void)addAnswerValuesObject:(NSString *)answerValue{
    
}
@end
