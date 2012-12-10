//
//  PoliticsViewController.h
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EKStreamView.h"

@interface PoliticsViewController : UIViewController <EKStreamViewDelegate>
{
    NSMutableArray *randomHeights;
}
@property (weak, nonatomic) IBOutlet EKStreamView *stream;

@end
