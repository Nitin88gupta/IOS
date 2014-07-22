//
//  NGViewController.h
//  NGSqlDataBase
//
//  Created by Nitin Gupta on 06/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NGDataBaseManager.h"

@interface NGViewController : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField *regNoTextField;
    IBOutlet UITextField *nameTextField;
    IBOutlet UITextField *departmentTextField;
    IBOutlet UITextField *yearTextField;
    IBOutlet UITextField *findByRegisterNumberTextField;
    IBOutlet UIScrollView *myScrollView;

}

-(IBAction)saveData:(id)sender;
-(IBAction)findData:(id)sender;


@end
