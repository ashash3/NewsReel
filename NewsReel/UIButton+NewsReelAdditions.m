//
//  UIButton+NewsReelAdditions.m
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "UIButton+NewsReelAdditions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIButton (NewsReelAdditions)

- (void)styleWith:(NSString*)category
{
    [self setBackgroundImage:[UIImage imageNamed:category] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed: [NSString stringWithFormat:@"%@Highlighted", category]] forState:UIControlStateHighlighted];
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowRadius = 1.5f;
    self.layer.shadowOpacity = 0.8f;
    self.layer.shadowOffset = CGSizeMake(0, 2);
}

@end
