//
//  NewsReelViewController.m
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "NewsReelViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIButton+NewsReelAdditions.h"
#import "PoliticsViewController.h"
#import "WaterfallViewController.h"

@interface NewsReelViewController ()

@end

@implementation NewsReelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"NewsReel";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    [self.politicsButton styleWith:@"politics"];
    [self.sportsButton styleWith:@"sports"];
    [self.technologyButton styleWith:@"technology"];
    [self.worldButton styleWith:@"world"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton*)sender
{
    if (sender.tag == 0) {
        NSMutableArray* politicsPhotos = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            [politicsPhotos addObject:[NSString stringWithFormat:@"politics%d.jpeg", i]];
        }
        WaterfallViewController* politicsWaterfall = [[WaterfallViewController alloc] initWithNibName:@"WaterfallViewController" bundle:nil];
        politicsWaterfall.images = politicsPhotos;
        politicsWaterfall.title = @"Politics";
        [self.navigationController pushViewController:politicsWaterfall animated:YES];
//        [self.navigationController pushViewController:[[PoliticsViewController alloc] initWithNibName:@"PoliticsViewController" bundle:nil] animated:YES];
    } 
}

@end
