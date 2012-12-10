//
//  NewsReelViewController.h
//  NewsReel
//
//  Created by Ashley Chou on 12/9/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsReelViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *politicsButton;
@property (weak, nonatomic) IBOutlet UIButton *sportsButton;
@property (weak, nonatomic) IBOutlet UIButton *technologyButton;
@property (weak, nonatomic) IBOutlet UIButton *worldButton;

- (IBAction)buttonPressed:(UIButton*)sender;

@end
