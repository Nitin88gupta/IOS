//
//  NGViewController.h
//  Web2PDF
//
//  Created by Nitin Gupta on 03/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NGPDFViewController.h"

@interface NGViewController : UIViewController <NGPDFDelegate> {
    IBOutlet UITextField *_urlTextField;
}

@property (nonatomic, strong) NGPDFViewController *PDFCreator;

@end
