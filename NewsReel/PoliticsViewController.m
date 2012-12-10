//
//  PoliticsViewController.m
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "PoliticsViewController.h"
#import "ImagePaneView.h"
#import "SingleImageViewController.h"

@interface PoliticsViewController ()

@end

@implementation PoliticsViewController
@synthesize stream;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    randomHeights = [[NSMutableArray alloc] initWithCapacity:100];
    for (int i = 0; i < 100; i++) {
        CGFloat h = arc4random() % 200 + 125.f;
        [randomHeights addObject:[NSNumber numberWithFloat:h]];
    }
    stream.scrollsToTop = YES;
    stream.cellPadding = 5.0f;
    stream.columnPadding = 5.0f;
    [stream reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - EKStream Methods

- (NSInteger)numberOfCellsInStreamView:(EKStreamView *)streamView
{
    return 5;
}

- (NSInteger)numberOfColumnsInStreamView:(EKStreamView *)streamView
{
    return 2;
}

- (UIView<EKResusableCell> *)streamView:(EKStreamView *)streamView cellAtIndex:(NSInteger)index
{
    static NSString *identifier = @"pane";
    
    ImagePaneView *imagePane;
    imagePane = (ImagePaneView*)[streamView dequeueReusableCellWithIdentifier:identifier];
    if (imagePane == nil) {
        imagePane = [[ImagePaneView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        imagePane.reuseIdentifier = identifier;
        imagePane.imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *selectionTap = [[UITapGestureRecognizer alloc]
                                                initWithTarget:self action:@selector(handleSingleTap:)];
        [imagePane addGestureRecognizer:selectionTap];
    }
    [imagePane.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"politics%d.jpeg", index]]];
    imagePane.tag = index;

    return imagePane;
}

- (CGFloat)streamView:(EKStreamView *)streamView heightForCellAtIndex:(NSInteger)index
{
    return [[randomHeights objectAtIndex:index] floatValue];
}

#pragma mark - Gesture Recognizer
- (IBAction)handleSingleTap:(UIGestureRecognizer*)sender
{
    SingleImageViewController* singleImage = [[SingleImageViewController alloc] initWithNibName:@"SingleImageViewController" bundle:nil];
    [self.navigationController pushViewController:singleImage animated:YES];
    singleImage.imageIndex = [NSString stringWithFormat:@"politics%d.jpeg", sender.view.tag];
}

@end
