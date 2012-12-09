//
//  NewsReelViewController.m
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "NewsReelViewController.h"

@interface NewsReelViewController ()

@end

@implementation NewsReelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"NewsReel";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
