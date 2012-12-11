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
#import "WaterfallViewController.h"
#import "ImageObject.h"
#import "PictureAggregator.h"

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
}

- (IBAction)buttonPressed:(UIButton*)sender
{
    PictureAggregator* picAgg = [[PictureAggregator alloc] init];
    if (sender.tag == 0) {
        NSMutableArray* politicsImages = [[picAgg getImages:@"politics"] copy];
        WaterfallViewController* politicsWaterfall = [[WaterfallViewController alloc] initWithNibName:@"WaterfallViewController" bundle:nil];
        politicsWaterfall.images = politicsImages;
        politicsWaterfall.title = @"Politics";
        [self.navigationController pushViewController:politicsWaterfall animated:YES];
    } else if (sender.tag == 1) {
        NSMutableArray* sportsImages = [[picAgg getImages:@"sports"] copy];
        WaterfallViewController* sportsWaterfall = [[WaterfallViewController alloc] initWithNibName:@"WaterfallViewController" bundle:nil];
        sportsWaterfall.images = sportsImages;
        sportsWaterfall.title = @"Sports";
        [self.navigationController pushViewController:sportsWaterfall animated:YES];
    } else if (sender.tag == 2) {
        NSMutableArray* scienceImages = [[picAgg getImages:@"science"] copy];
        WaterfallViewController* technologyWaterfall = [[WaterfallViewController alloc] initWithNibName:@"WaterfallViewController" bundle:nil];
        technologyWaterfall.images = scienceImages;
        technologyWaterfall.title = @"Technology";
        [self.navigationController pushViewController:technologyWaterfall animated:YES];
    } else if (sender.tag == 3) {
        NSMutableArray* worldImages = [[picAgg getImages:@"world"] copy];
        
        WaterfallViewController* worldWaterfall = [[WaterfallViewController alloc] initWithNibName:@"WaterfallViewController" bundle:nil];
        worldWaterfall.images = worldImages;
        worldWaterfall.title = @"World News";
        [self.navigationController pushViewController:worldWaterfall animated:YES];
    }
}

@end
