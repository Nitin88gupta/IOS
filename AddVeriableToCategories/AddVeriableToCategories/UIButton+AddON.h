//
//  UIButton+AddON.h
//  TestForFlow
//
//  Created by Nitin Gupta on 6/24/14.
//  Copyright (c) 2014 Abhishek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AddON)
/**
 *  @code       UIButton *_btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [_btn setTestString:@"Nitin"];
                NSLog(@"%@",[_btn testString]);
 
 */

@property (nonatomic, strong)NSString *testString;
@end
