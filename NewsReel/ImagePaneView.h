//
//  ImagePaneView.h
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EKStreamView.h"

@interface ImagePaneView : UIView<EKResusableCell>
{
    NSString* reuseIdentifier;
}

@property (nonatomic, readonly) UIImageView* imageView;
@property (nonatomic, readonly) UIView* contentView;
@property (nonatomic, readonly) UILabel* caption;
@end
