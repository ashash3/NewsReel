//
//  Bing.m
//  BingCaller
//
//  Created by MasonMeier on 12/10/12.
//  Copyright 2012 Duke University. All rights reserved.
//

#import "Bing.h"
#import "ImageObject.h"
#import "NSData_Base64.h"

@interface Bing ()
- (void)asyncLoad:(NSString *)fullUri;
- (NSMutableURLRequest *)getRequest:(NSString *)fullUri;
@end

@implementation Bing
@synthesize busy;
@synthesize currentElementData;

/***
 * Initializes the instance.
 ***/

- (id)init
{
	if (self = [super init])
	{
        self->parsedStories=0;
		self->busy = NO;
		self->debug = NO;
		// Replace the following with your account key.
		self->accountKey = @"JVNXLprJ67Sa64wfjxRo7RlsigqRF+Y2q+aOyafQPDU=";
		self->rootUri = @"https://api.datamarket.azure.com/Bing/Search/";
        self->pictures = [[NSMutableArray alloc] init];
        self->currentPicture = [[ImageObject alloc] init];
        self->currentElementData = [[NSMutableString alloc] init];
	}
	return self;
}

/***
 * Main entry point to perform the search for PICTURES.
 ***/

- (void) searchImage:(NSString*)query withIndex:(int)parsedImages
{
	parsedStories = parsedImages;
    self->parsingNews = NO;
	NSInteger numResults = 1;

	NSMutableString *fullUri = [NSMutableString stringWithCapacity:256];
	[fullUri appendString:rootUri];
	[fullUri appendFormat:@"Image?"];
	[fullUri appendFormat:@"Query=%@",
	 	[query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	[fullUri appendFormat:@"&$top=%d", numResults];
	[self asyncLoad:fullUri];
}

/***
 * Main entry point to perform the search for NEWS.
 ***/

- (void)searchNews:(NSString *)query inCategory:(NSString *)category
{
    self->parsingNews = YES;
	NSMutableString *fullUri = [NSMutableString stringWithCapacity:256];
	[fullUri appendString:rootUri];
	[fullUri appendFormat:@"News?"];
    [fullUri appendFormat:@"NewsCategory=%@",
	 	[category stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	[fullUri appendFormat:@"&Query=%@",
	 	[query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [self asyncLoad:fullUri];
}

/***
 * Performs an asynchronous load.
 ***/
- (void)asyncLoad:(NSString *)fullUri
{
	self->busy = YES;
	if (debug) NSLog(@"Begin asynchronous request");
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:
								   [self getRequest:fullUri] delegate:self];

	if (connection)
	{
		if (debug) NSLog(@"Connection established");
//		self->responseData = [[NSMutableData data] retain];
		self->responseData = [NSMutableData data];
	}
	else
	{
		if (debug) NSLog(@"Connection failed");
		self->busy = NO;
	}
}

/***
 Gets the request object, fully initialized with headers.
 ***/
-(NSMutableURLRequest *)getRequest:(NSString *)fullUri
{
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:fullUri]];
	[request setHTTPMethod:@"GET"];
	NSString *authStr = [NSString stringWithFormat:@"%@:%@", accountKey, accountKey];
	NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
	NSString *authValue = [NSString stringWithFormat:@"Basic %@",
						   [authData base64Encoding]];
	[request setValue:authValue forHTTPHeaderField:@"Authorization"];
	return request;
}

/***
 * Delegate to handle receiving a response.
 * This delegate could be called more than once.
 ***/
- (void)connection:(NSURLConnection *)connection didReceiveResponse:
(NSHTTPURLResponse *)response
{
	if (debug) NSLog(@"Response Code: %d", [response statusCode]);
	[self->responseData setLength:0];
}

/***
 * Delegate to handle receiving a chunk of data.
 ***/

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	if (debug) NSLog(@"Did receive data - received %d bytes", [data length]);
	[self->responseData appendData:data];
}

/***
 * Delegate to handle successful completeion of the asyncronous request.
 * Creates an XML parser, parses the response, releases resources,
 * and sets the busy flag to NO.
 ***/
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (debug) NSLog(@"Finished loading: Received %d bytes of data",[self->responseData length]);
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData: self->responseData];
	[parser setDelegate: self];
	[parser parse];

	// release the connection, and the data object
//	[connection release];
//	[self->responseData release];
	self->busy = NO;
	if (debug) NSLog(@"Connection is done loading!");
}

/***
 * Delegate to handle failure in the asyncronous request.
 * Releases resources, emits a message, and sets the busy flag to NO.
 ***/
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
//	[connection release];
//	[self->responseData release];
	if (debug) NSLog(@"Connection failed Error - %@", [error localizedDescription]);
	self->busy = NO;
}

/***
 * Delegate to handle starting an XML element parse.
 * If the element is "d:Title", set the flag.
 ***/
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict
{
	self->isNewsTitle = ([elementName isEqualToString:@"d:Title"] && self->parsingNews);
    self->isMediaUrl = ([elementName isEqualToString:@"d:MediaUrl"]);
	self->isThumbnail = ([elementName isEqualToString:@"d:Thumbnail"]);
	self->isNewsUrl = ([elementName isEqualToString:@"d:Url"]);
}

/***
 * Delegate to handle finding characters during an XML element parse.
 * If the flag is set, output the title.
 ***/
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (debug) NSLog(@"Found Element: %@", string);
	if (self->isNewsTitle){
        [currentElementData appendString:string];
	} else if (self->isMediaUrl){
		[currentElementData appendString:string];
	} else if (self->isThumbnail){
		[currentElementData appendString:string];
	} else if (self->isNewsUrl){
		[currentElementData appendString:string];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if (self->isNewsTitle) {
		if (debug) NSLog(@"\n\nFull title: %@", currentElementData);
		ImageObject* image = [[ImageObject alloc] init];
		image.caption = [currentElementData copy];
		[pictures addObject:image];
		[currentElementData setString:@""];
		self->isNewsTitle = NO;
	} else if (self->isMediaUrl) {
		if (debug) NSLog(@"Media Url: %@", currentElementData);
		ImageObject* image = [pictures objectAtIndex:parsedStories];
      	if (!image.picLink) {
          	image.picLink = [currentElementData copy];
        } else {
        	image.thumbnail = [currentElementData copy];
        }
		[currentElementData setString:@""];
		self->isMediaUrl = NO;
	 } else if (self->isThumbnail){
		if (debug) NSLog(@"Thumbnail: %@", currentElementData);
		ImageObject* image = [pictures objectAtIndex:parsedStories];
		image.thumbnail = [currentElementData copy];
		self->isThumbnail = NO;
		[currentElementData setString:@""];
	} else if (self->isNewsUrl){
		if (debug) NSLog(@"News Url: %@", currentElementData);
		ImageObject* image = [pictures objectAtIndex:parsedStories];
		image.articleLink = [currentElementData copy];
		self->isNewsUrl = NO;
		self->parsedStories++;
		[currentElementData setString:@""];
	}
 }

- (void)printPictureArray {
	int count = 0;
	for (ImageObject *image in pictures) {
        NSLog (@"Story %d:\nCaption:\t%@\nArticle Link:\t%@\nPicture Link:\t%@\nThumbnail:\t%@\n\n", count++, image.caption, image.articleLink, image.picLink, image.thumbnail);
	}
}

- (void) resetPictureArray {
	self->parsedStories = 0;
	[pictures removeAllObjects];
}

- (NSMutableArray*)getPictureArray {
	return self->pictures;
}

- (ImageObject*)getCurrentPicture {
	return self->currentPicture;
}

@end
