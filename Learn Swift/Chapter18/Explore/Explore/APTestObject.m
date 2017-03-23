//
//  APTestObject.m
//  Explore
//
//  Created by Waqar A. Malik on 2/1/15.
//  Copyright (c) 2015 Apress, Inc. All rights reserved.
//

@import UIKit;
#import "Explore-Swift.h"

#import "APTestObject.h"

@implementation APTestObject
{
@private
    NSString *_title;
}
- (void)setTitle:(NSString *)title
{
    _title = title;
}

- (NSString *)title
{
    return _title;
}

- (void)myMethod
{
}
@end
