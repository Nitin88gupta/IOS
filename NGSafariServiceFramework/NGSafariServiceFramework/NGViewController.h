//
//  NGViewController.h
//  NGSafariServiceFramework
//
//  Created by Nitin Gupta on 31/01/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SafariServices/SafariServices.h>

@interface NGViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UILabel *invalidLabel;

- (IBAction)addUrlToReadingList:(id)sender;
- (IBAction)launchSaffariAction:(id)sender;


@end
