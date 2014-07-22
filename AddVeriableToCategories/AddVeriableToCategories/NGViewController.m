//
//  NGViewController.m
//  AddVeriableToCategories
//
//  Created by Nitin Gupta on 6/24/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGViewController.h"
#import "UIButton+AddON.h"

@interface NGViewController ()

@end

@implementation NGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setTestString:@"Nitin"];
    NSLog(@"%@",[_btn testString]);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
