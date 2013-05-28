//
//  FFAPlayer.m
//  financialflow
//
//  Created by Fabian on 18.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import "FFAPlayer.h"

@implementation FFAPlayer

@synthesize name;
@synthesize age;
@synthesize gender;
@synthesize unlockedLevelTwo;
@synthesize unlockedLevelThree;
@synthesize unlockedLevelFour;
@synthesize unlockedDiploma;
@synthesize currentQuestion;
@synthesize answerValues;
@synthesize deviceID;
@synthesize pointsInLevel1;
@synthesize pointsInLevel2;
@synthesize pointsInLevel3;
@synthesize pointsInLevel4;
@synthesize boatPosX;
@synthesize boatPosY;

#pragma mark Singleton Methods

+ (id)sharedPlayer {
    static FFAPlayer *sharedMyPlayer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyPlayer = [[self alloc] init];
    });
    return sharedMyPlayer;
}

- (id)init {
    if (self = [super init]) {
        name = @"Me";
        age = 0;
        gender = UnKnown;
        
        unlockedLevelTwo = NO;
        unlockedLevelThree = NO;
        unlockedLevelFour = NO;
        unlockedDiploma = NO;
         
        /*
        unlockedLevelTwo = YES;
        unlockedLevelThree = YES;
        unlockedLevelFour = YES;
        unlockedDiploma = YES;
        
         */
        pointsInLevel1 = 0;
        pointsInLevel2 = 0;
        pointsInLevel3 = 0;
        pointsInLevel4 = 0;
        currentQuestion = 0;
        boatPosX = 0.0;
        boatPosY = 0.0;
         
        answerValues = [[NSMutableArray alloc] init];
        
        CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
        NSString * uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
        CFRelease(newUniqueId);
        
        deviceID = uuidString;
    }
    return self;
}
@end
