//
//  SingleImageViewController.m
//  NewsReel
//
//  Created by Ashley Chou on 12/10/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "SingleImageViewController.h"

@interface SingleImageViewController ()

@end

@implementation SingleImageViewController
@synthesize imageIndex = _imageIndex;
@synthesize currentImage;

- (void)setImageIndex:(NSString *)imageIndex
{
    _imageIndex = [imageIndex copy];
    [currentImage setImage:[UIImage imageNamed:_imageIndex]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
