#include <Foundation/Foundation.h>
#import "Bing.h"

@interface PictureAggregator : NSObject
{
@private
	Bing* bing;
//	NSAutoreleasePool *pool;
	NSString* searchCategory;
	BOOL debug;
}

- (id) init;
- (NSMutableArray*) getNewsStoriesForCategory:(NSString*)category;
- (NSMutableArray*) getPicturesForNews:(NSMutableArray*)newsStories;
// - (int) close;
- (void) imageTestSearch;
- (NSMutableArray*) getImages:(NSString*)category;
- (void) printArray:(NSMutableArray*)array;
@end
