//
//  WebViewController.m
//  NewsReel
//
//  Created by Ashley Chou on 12/10/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize webView;
@synthesize articleLink = _articleLink;

- (void)setArticleLink:(NSString *)articleLink
{
    _articleLink = [articleLink copy];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_articleLink]]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
