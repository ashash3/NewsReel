//
//  Bing.h
//  BingCaller
//
//  Created by MasonMeier on 12/10/12.
//  Copyright 2012 Duke University. All rights reserved.
//
#include <Foundation/Foundation.h>
#import "ImageObject.h"

@interface Bing : NSObject <NSXMLParserDelegate>
{
@private
	NSString *rootUri;
	NSMutableString *currentElementData;
	NSString *accountKey;
	NSMutableData *responseData;
	NSMutableArray *pictures;
	ImageObject *currentPicture;
    int parsedStories;
    BOOL busy, parsingNews, debug;
	BOOL isNewsTitle, isImageTitle, isMediaUrl, isSourceUrl, isDisplayUrl, isThumbnail, isNewsUrl;
}

@property (readonly) BOOL busy;
@property (nonatomic, retain) NSMutableString *currentElementData;
- (id) init;
- (void) searchImage:(NSString*)query withIndex:(int)parsedImages;
- (void) searchNews:(NSString*)query inCategory:(NSString*)category;
- (void) printPictureArray;
- (void) resetPictureArray;
- (NSMutableArray*)getPictureArray;
- (ImageObject*)getCurrentPicture;
@end
