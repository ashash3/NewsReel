//
//  SingleImageViewController.m
//  NewsReel
//
//  Created by Ashley Chou on 12/10/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "SingleImageViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SingleImageViewController ()

@end

@implementation SingleImageViewController
@synthesize imageIndex = _imageIndex;
@synthesize currentImage;
@synthesize captionView;
@synthesize caption;

- (void)setImageIndex:(NSString *)imageIndex
{
    _imageIndex = [imageIndex copy];
    [currentImage setImage:[UIImage imageNamed:_imageIndex]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        currentImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
        currentImage.contentMode = UIViewContentModeScaleAspectFill;
        currentImage.clipsToBounds = YES;
        [self.view addSubview:currentImage];
        
        captionView = [[UIView alloc] initWithFrame:self.view.bounds];
        caption = [[UILabel alloc] initWithFrame:self.view.bounds];
        caption.text = @"Twitter launches photo filters for iOS and Android apps merp blah twitter twitter twitter wheee blerp blerp herp werp bleh";
        [caption setFont:[UIFont fontWithName:@"Verdana-Italic" size:14]];
        caption.numberOfLines = 0;
        [caption sizeToFit];
        caption.backgroundColor = [UIColor clearColor];
        
        caption.frame = CGRectMake(captionView.frame.size.width*0.02, captionView.frame.size.width*0.02, captionView.frame.size.width*0.96, caption.frame.size.height);

        captionView.backgroundColor = [UIColor whiteColor];
        [captionView setAlpha:0.7f];

        captionView.frame = CGRectMake(0, self.view.frame.size.height-caption.frame.size.height-captionView.frame.size.width*0.04, self.view.frame.size.width, caption.frame.size.height+captionView.frame.size.width*0.04);

        [captionView addSubview:caption];
        [self.view addSubview:captionView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
