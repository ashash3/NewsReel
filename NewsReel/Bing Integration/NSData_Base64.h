//
//  NSData_Base64.h
//  BingCaller
//
//  Created by MasonMeier on 12/10/12.
//  Copyright 2012 Duke University. All rights reserved.
//

#include <Foundation/Foundation.h>

/***
 * A category to add Base64 encoding to the NSData type.
 ***/
@interface NSData (Base64)
- (NSString *)base64Encoding;
@end
