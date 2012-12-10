//
//  ImagePaneView.m
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "ImagePaneView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ImagePaneView
@synthesize imageView;
@synthesize reuseIdentifier;
@synthesize contentView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        contentView = [[UIView alloc] initWithFrame:self.bounds];
        imageView = [[UIImageView alloc] initWithFrame:contentView.bounds];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [contentView addSubview:imageView];
        contentView.clipsToBounds = YES;
        self.layer.masksToBounds = NO;
        self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        self.layer.shadowRadius = 1.5f;
        self.layer.shadowOpacity = 0.8f;
        self.layer.shadowOffset = CGSizeMake(0, 2);
        [self addSubview:contentView];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    contentView.frame = self.bounds;
    imageView.frame = contentView.bounds;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
}

@end
