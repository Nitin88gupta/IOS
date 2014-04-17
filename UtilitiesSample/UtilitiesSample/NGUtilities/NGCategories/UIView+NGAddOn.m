//
//  UIView+NGAddOn.m
//  NGGameKit
//
//  Created by Nitin Gupta on 24/02/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "UIView+NGAddOn.h"

@implementation UIView (NGAddOn)

- (void)setPosition:(CGPoint)_aPoint {
    CGRect _newRect = CGRectMake(_aPoint.x, _aPoint.y, self.frame.size.width, self.frame.size.height);
    [self setFrame:_newRect];
}

- (void)setSize:(CGSize)_aSize {
    CGRect _newRect = CGRectMake(self.frame.origin.x, self.frame.origin.y, _aSize.width, _aSize.height);
    [self setFrame:_newRect];
}

@end
