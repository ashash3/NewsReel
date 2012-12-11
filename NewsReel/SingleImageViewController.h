//
//  SingleImageViewController.h
//  NewsReel
//
//  Created by Ashley Chou on 12/10/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageObject.h"

@interface SingleImageViewController : UIViewController
@property (copy, nonatomic) ImageObject* imageModel;
@property (strong, nonatomic) UIImageView *currentImage;
@property (strong, nonatomic) UIView* captionView;
@property (strong, nonatomic) UILabel* caption;

@end
