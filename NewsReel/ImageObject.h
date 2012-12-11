//
//  ImageObject.h
//  NewsReel
//
//  Created by Ashley Chou on 12/11/12.
//  Copyright (c) 2012 Ashley Chou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageObject : NSObject {
    NSString* caption;
    NSString* picLink;
    NSString* articleLink;
    NSString* thumbnail;
}
@property (copy, nonatomic) NSString* caption;
@property (copy, nonatomic) NSString* picLink;
@property (copy, nonatomic) NSString* articleLink;
@property (copy, nonatomic) NSString* thumbnail;

@end
