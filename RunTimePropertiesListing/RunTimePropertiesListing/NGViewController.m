//
//  NGViewController.m
//  RunTimePropertiesListing
//
//  Created by Nitin Gupta on 6/13/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGViewController.h"
#import "NSObject+AddOn.h"

@interface NGViewController ()
@property (nonatomic, assign) NSString *middleName;
@end

@implementation NGViewController
@synthesize firstName;
@synthesize lastName;
@synthesize middleName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.firstName = @"Nitin";
    self.middleName = @"Kumar";
    self.lastName = @"Gupta";
    
    NSString *_str = [self description_NG];
    NSLog(@"%@",_str);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
