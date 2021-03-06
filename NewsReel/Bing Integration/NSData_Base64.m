//
//  NSData_Base64.m
//  BingCaller
//
//  Created by MasonMeier on 12/10/12.
//  Copyright 2012 Duke University. All rights reserved.
//

#import "NSData_Base64.h"

static const char encodingTable[] =
"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation NSData (Base64)

/***
 * Returns an NSString that is Base64 encoded from the data in the current instance.
 ***/
- (NSString *)base64Encoding
{
	if ([self length] == 0) return @"";
	char *characters = malloc((([self length] + 2) / 3) * 4);
	if (characters == NULL) return nil;
	
	NSUInteger length = 0;
	NSUInteger i = 0;
	while (i < [self length])
	{
		char buffer[3] = {0,0,0};
		short bufferLength = 0;
		
		while (bufferLength < 3 && i < [self length])
			buffer[bufferLength++] = ((char *)[self bytes])[i++];
		characters[length++] = encodingTable[(buffer[0] & 0xFC) >> 2];
		characters[length++] = encodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
		if (bufferLength > 1)
			characters[length++] = encodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
		else characters[length++] = '=';
		if (bufferLength > 2)
			characters[length++] = encodingTable[buffer[2] & 0x3F];
		else characters[length++] = '=';
	}
	
//	return [[[NSString alloc] initWithBytesNoCopy:characters length:length
//										 encoding:NSASCIIStringEncoding freeWhenDone:YES] autorelease];
	return [[NSString alloc] initWithBytesNoCopy:characters length:length
										 encoding:NSASCIIStringEncoding freeWhenDone:YES];
}

@end
