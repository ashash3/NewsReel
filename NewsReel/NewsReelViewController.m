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
@property (strong, nonatomic) PictureAggregator* picAgg;

@end

@implementation NewsReelViewController
@synthesize picAgg;
NSMutableArray* politicsImages;
NSMutableArray* sportsImages;
NSMutableArray* scienceImages;
NSMutableArray* worldImages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        picAgg = [[PictureAggregator alloc] init];
        politicsImages = [[picAgg getImages:@"politics"] copy];
        sportsImages = [[picAgg getImages:@"sports"] copy];
        scienceImages = [[picAgg getImages:@"science"] copy];
        worldImages = [[picAgg getImages:@"world"] copy];
    }
    return self;
}

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
    if (sender.tag == 0) {
        WaterfallViewController* politicsWaterfall = [[WaterfallViewController alloc] initWithNibName:@"WaterfallViewController" bundle:nil];
        politicsWaterfall.images = politicsImages;
        politicsWaterfall.title = @"Politics";
        [self.navigationController pushViewController:politicsWaterfall animated:YES];
    } else if (sender.tag == 1) {
        WaterfallViewController* sportsWaterfall = [[WaterfallViewController alloc] initWithNibName:@"WaterfallViewController" bundle:nil];
        sportsWaterfall.images = sportsImages;
        sportsWaterfall.title = @"Sports";
        [self.navigationController pushViewController:sportsWaterfall animated:YES];
    } else if (sender.tag == 2) {
        WaterfallViewController* technologyWaterfall = [[WaterfallViewController alloc] initWithNibName:@"WaterfallViewController" bundle:nil];
        technologyWaterfall.images = scienceImages;
        technologyWaterfall.title = @"Technology";
        [self.navigationController pushViewController:technologyWaterfall animated:YES];
    } else if (sender.tag == 3) {
        
        WaterfallViewController* worldWaterfall = [[WaterfallViewController alloc] initWithNibName:@"WaterfallViewController" bundle:nil];
        worldWaterfall.images = worldImages;
        worldWaterfall.title = @"World News";
        [self.navigationController pushViewController:worldWaterfall animated:YES];
    }
}

@end
