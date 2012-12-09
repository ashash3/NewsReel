//
//  NewsReelAppDelegate.h
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsReelViewController;

@interface NewsReelAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) NewsReelViewController *viewController;

@end
