//
//  NSKitNumberFormatter.m
//  NSKit
//
//  Created by Patrick Chamelo on 02/05/14.
//  Copyright (c) 2015 Patrick Chamelo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "NSKitNumberFormatter.h"

@implementation NSKitNumberFormatter

/// Compatibility method
- (BOOL)isPartialStringValid:(NSString *)partialString
			newEditingString:(NSString **)newString
            errorDescription:(NSString **)error
{
    NSNumber *number = [self numberFromString:partialString];
    if ([number integerValue] > self.maximumValue){
        NSBeep();
        return NO;
    }
    // allow numbers, decimal point
	NSCharacterSet *disallowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSRange foundRange = [partialString rangeOfCharacterFromSet:disallowedCharacters];
	if (foundRange.location != NSNotFound){
        NSBeep();
        return NO;
	}
    return YES;
}


@end
