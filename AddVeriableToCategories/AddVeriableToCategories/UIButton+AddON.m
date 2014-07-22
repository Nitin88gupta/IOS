//
//  UIButton+AddON.m
//  TestForFlow
//
//  Created by Nitin Gupta on 6/24/14.
//  Copyright (c) 2014 Abhishek. All rights reserved.
//

#import "UIButton+AddON.h"
#import <objc/runtime.h>

static char aKey;
@implementation UIButton (AddON)
@dynamic testString;

-(void)setTestString:(NSString *)testString {
    objc_setAssociatedObject (self, &aKey,testString,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)testString {
    return objc_getAssociatedObject(self, &aKey);
}

@end
