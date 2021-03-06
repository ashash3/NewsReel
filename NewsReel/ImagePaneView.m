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
@synthesize caption;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        contentView = [[UIView alloc] initWithFrame:self.bounds];
        contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];

        caption = [[UILabel alloc] initWithFrame:contentView.bounds];
        caption.backgroundColor = [UIColor clearColor];
        [caption setFont:[UIFont fontWithName:@"Verdana-Italic" size:11.5]];        
        imageView = [[UIImageView alloc] initWithFrame:contentView.bounds];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [contentView addSubview:imageView];
        [contentView addSubview:caption];
        [contentView.layer setCornerRadius:2.0f];
        imageView.clipsToBounds = YES;
        contentView.clipsToBounds = YES;
        imageView.layer.masksToBounds = NO;
        imageView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        imageView.layer.shadowRadius = 0.75f;
        imageView.layer.shadowOpacity = 0.8f;
        imageView.layer.shadowOffset = CGSizeMake(0, 1);
        imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
        
        self.layer.masksToBounds = NO;
        self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        self.layer.shadowRadius = 1.5f;
        self.layer.shadowOpacity = 0.8f;
        self.layer.shadowOffset = CGSizeMake(0.5, 2);
        [self.layer setCornerRadius:2.0f];
        
        [self addSubview:contentView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // Size of frame is equal to the randomized size generated
    contentView.frame = self.bounds;
    caption.frame = CGRectMake(contentView.bounds.size.width*0.02,
                               contentView.bounds.size.height-caption.font.pointSize*2.7,
                               contentView.bounds.size.width*0.96,
                               caption.font.pointSize*2.8);
    

    imageView.frame = CGRectMake(0,
                                 0,
                                 contentView.bounds.size.width,
                                 contentView.bounds.size.height-caption.frame.size.height);    
    caption.numberOfLines = 0;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    imageView.layer.shadowPath = [UIBezierPath bezierPathWithRect:imageView.bounds].CGPath;
}

@end
