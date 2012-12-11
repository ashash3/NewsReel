//
//  SingleImageViewController.h
//  NewsReel
//
//  Created by Ashley Chou on 12/10/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleImageViewController : UIViewController
@property (copy, nonatomic) NSString* imageIndex;
@property (strong, nonatomic) UIImageView *currentImage;
@property (strong, nonatomic) UIView* captionView;
@property (strong, nonatomic) UILabel* caption;

@end
