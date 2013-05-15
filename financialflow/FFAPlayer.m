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
@synthesize currentQuestion;
@synthesize answerValues;
@synthesize deviceID;

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
        currentQuestion = 0;
        answerValues = [[NSMutableArray alloc] init];
        
        CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
        NSString * uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
        CFRelease(newUniqueId);
        
        deviceID = uuidString;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
