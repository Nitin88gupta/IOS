//
//  NGViewController.m
//  NGSqlDataBase
//
//  Created by Nitin Gupta on 06/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGViewController.h"

@interface NGViewController ()

@end

@implementation NGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    BOOL _result = [[NGDataBaseManager getSharedInstance] initializeDataBase];
    NSAssert(_result, @"_result Failed");
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)saveData:(id)sender{
    BOOL success = NO;
    [self resignAllFirstResponder];
    NSString *alertString = @"Data Insertion failed";
    if (regNoTextField.text.length>0 &&nameTextField.text.length>0 &&
        departmentTextField.text.length>0 &&yearTextField.text.length>0 )
    {
        success = [[NGDataBaseManager getSharedInstance]saveData:
                   regNoTextField.text name:nameTextField.text department:
                   departmentTextField.text year:yearTextField.text];
    }
    else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              alertString message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(IBAction)findData:(id)sender{
    [self resignAllFirstResponder];
    NSArray *_dataArr = [[NGDataBaseManager getSharedInstance]findByRegisterNumber:
                     findByRegisterNumberTextField.text];
    if (_dataArr == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Data not found" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        regNoTextField.text = @"";
        nameTextField.text =@"";
        departmentTextField.text = @"";
        yearTextField.text =@"";
    }
    else{
        NSLog(@"Data: %@",_dataArr);
        regNoTextField.text = findByRegisterNumberTextField.text;
        nameTextField.text =[_dataArr objectAtIndex:0];
        departmentTextField.text = [_dataArr objectAtIndex:1];
        yearTextField.text =[_dataArr objectAtIndex:2];
    }
}

#pragma mark - Text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [myScrollView setFrame:CGRectMake(10, 50, 300, 200)];
    [myScrollView setContentSize:CGSizeMake(300, 350)];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [myScrollView setFrame:CGRectMake(10, 50, 300, 350)];
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

-(void)resignAllFirstResponder {
    [regNoTextField resignFirstResponder];
    [nameTextField resignFirstResponder];
    [departmentTextField resignFirstResponder];
    [yearTextField resignFirstResponder];
    [findByRegisterNumberTextField resignFirstResponder];
}

@end
