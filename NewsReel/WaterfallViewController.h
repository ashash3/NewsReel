//
//  WaterfallViewController.h
//  NewsReel
//
//  Created by Ashley Chou on 12/10/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EKStreamView.h"

@interface WaterfallViewController : UIViewController<EKStreamViewDelegate>
{
    NSMutableArray* randomHeights;
}

@property (copy, nonatomic) NSArray* images;

@property (weak, nonatomic) IBOutlet EKStreamView *stream;

@end
