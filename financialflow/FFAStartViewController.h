//
//  FFAStartViewController.h
//  financialflow
//
//  Created by Fabian on 04.04.13.
//  Copyright (c) 2013 Fabian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFAPlayer.h"

@interface FFAStartViewController : UIViewController

//@property (strong) FFAPlayer *playerData;

- (IBAction)shareApp:(id)sender;
+ (FFAStartViewController *) sharedInstance;
@end
