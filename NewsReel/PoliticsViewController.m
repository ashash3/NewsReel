//
//  PoliticsViewController.m
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "PoliticsViewController.h"
#import "ImagePaneView.h"

@interface PoliticsViewController ()

@end

@implementation PoliticsViewController
@synthesize stream;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    }
    [imagePane.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"politics%d.jpeg", index]]];
    
    return imagePane;
}

- (CGFloat)streamView:(EKStreamView *)streamView heightForCellAtIndex:(NSInteger)index
{
//    return self.view.frame.size.height/2;
    return [[randomHeights objectAtIndex:index] floatValue];
}
@end
