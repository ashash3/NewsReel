#import "PictureAggregator.h"

@implementation PictureAggregator

- (id) init {
	self->debug = NO;
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	bing = [[[Bing alloc] init] autorelease];
	searchCategory = @"'rt_Sports'";
	return self;
}

- (NSMutableArray*) getNewsStoriesForCategory:(NSString*) category {
	[bing resetPictureArray];
	NSString *query = @"''";
    [bing searchNews:query inCategory:category];

	// This prevents the app from exiting before the async operation is complete.
	while (bing.busy)
	{
		[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
								 beforeDate:[NSDate distantFuture]];
	}
	if (debug) NSLog(@"Done with news aggregation");
	return [bing getPictureArray];
}

- (NSMutableArray*) getPicturesForNews:(NSMutableArray*)newsStories {
	int parsedImages = 0;
	for (ImageObject *news in newsStories) {
		NSMutableString *query = [NSMutableString stringWithCapacity:256];
		[query appendFormat:@"'%@'",news.caption];
    	[bing searchImage:query withIndex:parsedImages];
    	
    	// This prevents the app from exiting before the async operation is complete.
    	while (bing.busy)
		{
			[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
									 beforeDate:[NSDate distantFuture]];
		}
		ImageObject* currImage = [bing getCurrentPicture];
		parsedImages++;
	}
	if (debug) NSLog(@"Done with picture aggregation");
	return [bing getPictureArray];
}	

- (NSMutableArray*) getImages:(NSString*)category {
	if ([[category lowercaseString] isEqualToString:@"sports"]) {
		searchCategory = @"'rt_Sports'";
	} else if ([[category lowercaseString] isEqualToString:@"politics"]) {
		searchCategory = @"'rt_Politics'";
	} else if ([[category lowercaseString] isEqualToString:@"world"]) {
		searchCategory = @"'rt_World'";
	} else if ([[category lowercaseString] isEqualToString:@"technology"] || [[category lowercaseString] isEqualToString:@"science"]) {
		searchCategory = @"'rt_ScienceAndTechnology'";
	}
	NSMutableArray* newsStories = [self getNewsStoriesForCategory:searchCategory];
	NSMutableArray* imageObjects = [self getPicturesForNews:newsStories];
	if (debug) [bing printPictureArray];
	[self close];
	return imageObjects;
}

- (void) imageTestSearch {
	NSString* query = @"'NFL should be ashamed of its weak DUI policy'";
	[bing searchImage:query withIndex:0];
	while (bing.busy)
	{
		[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
									 beforeDate:[NSDate distantFuture]];
	}
	NSLog(@"Image Test Search Complete!");
}

- (void) printArray:(NSMutableArray*)array {
	int count = 0;
	for (ImageObject *image in array) {
        NSLog (@"Story %d:\nCaption:\t%@\nArticle Link:\t%@\nPicture Link:\t%@\nThumbnail:\t%@\n\n", count++, image.caption, image.articleLink, image.picLink, image.thumbnail);
	}
}

- (int) close {
	[pool drain];
	return 0;
} 

@end