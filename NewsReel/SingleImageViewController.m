//
//  SingleImageViewController.m
//  NewsReel
//
//  Created by Ashley Chou on 12/10/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "SingleImageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "WebViewController.h"
#import "ImageObject.h"
#import "UIImageView+AFNetworking.h"

@interface SingleImageViewController ()

@end

@implementation SingleImageViewController
@synthesize imageModel = _imageModel;
@synthesize currentImage;
@synthesize captionView;
@synthesize caption;

- (void)setImageModel:(ImageObject*)imageModel
{
    _imageModel = imageModel;
    [self.currentImage setImageWithURL:[NSURL URLWithString:_imageModel.picLink]];
    [self.caption setText:_imageModel.caption];
    self.caption.numberOfLines = 0;
    [self.caption sizeToFit];
    self.captionView.frame = CGRectMake(0, self.view.frame.size.height-self.caption.frame.size.height-self.captionView.frame.size.width*0.04, self.view.frame.size.width, self.caption.frame.size.height+self.captionView.frame.size.width*0.04);
}

- (ImageObject*)imageModel
{
    return _imageModel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.currentImage.contentMode = UIViewContentModeScaleAspectFill;
    self.currentImage.clipsToBounds = YES;
    self.currentImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *selectionTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.currentImage addGestureRecognizer:selectionTap];
    [self.view addSubview:currentImage];
    
    self.captionView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.caption = [[UILabel alloc] initWithFrame:self.view.bounds];
    [self.caption setFont:[UIFont fontWithName:@"Verdana-Italic" size:14]];
    self.caption.backgroundColor = [UIColor clearColor];
    self.caption.frame = CGRectMake(self.captionView.frame.size.width*0.02,
                                    self.captionView.frame.size.width*0.02,
                                    self.captionView.frame.size.width*0.96,
                                    self.caption.frame.size.height);
    self.captionView.backgroundColor = [UIColor whiteColor];
    [self.captionView setAlpha:0.7f];
    [self.captionView addSubview:self.caption];
    [self.view addSubview:self.captionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleSingleTap:(UIGestureRecognizer*)sender
{
    WebViewController* webView = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    [self.navigationController pushViewController:webView animated:YES];
    webView.articleLink = self.imageModel.articleLink;
}
@end
