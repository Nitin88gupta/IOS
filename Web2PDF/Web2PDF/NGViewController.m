//
//  NGViewController.m
//  Web2PDF
//
//  Created by Nitin Gupta on 03/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGViewController.h"

@interface NGViewController ()

@end

@implementation NGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_urlTextField setText:@"https://github.com/Nitin88gupta/IOS"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) validateURL {
    return (_urlTextField && [[_urlTextField text] length]);
}

- (void) popUrlInvalidError {
    
}

#pragma mark Button Actions
- (IBAction)loadGeneratorPDFUsingDelegate:(id)sender {
    if ([self validateURL]) {
        self.PDFCreator = [NGPDFViewController createPDFWithURL:[NSURL URLWithString:[_urlTextField text]]
                                                     pathForPDF:[@"~/Documents/NGPDF_delegateDemo.pdf" stringByExpandingTildeInPath]
                                                       delegate:self
                                                       pageSize:kPaperSizeA4
                                                        margins:UIEdgeInsetsMake(10, 5, 10, 5)];
    } else {
        [self popUrlInvalidError];
    }
}

- (IBAction)loadGeneratorPDFUsingBlocks:(id)sender {
    if ([self validateURL]) {
        self.PDFCreator = [NGPDFViewController createPDFWithURL:[NSURL URLWithString:[_urlTextField text]] pathForPDF:[@"~/Documents/NGPDF_blocksDemo.pdf" stringByExpandingTildeInPath] pageSize:kPaperSizeA4 margins:UIEdgeInsetsMake(10, 5, 10, 5) successBlock:^(NGPDFViewController *webHTMLtoPDF) {
            NSString *result = [NSString stringWithFormat:@"webHTMLtoPDF did succeed (%@ / %@)", webHTMLtoPDF, webHTMLtoPDF.PDFpath];
            NSLog(@"%@",result);
        } errorBlock:^(NGPDFViewController *webHTMLtoPDF) {
            NSString *result = [NSString stringWithFormat:@"webHTMLtoPDF did fail (%@)", webHTMLtoPDF];
            NSLog(@"%@",result);
        }];
    } else {
        [self popUrlInvalidError];
    }
}

#pragma mark NDwebHTMLtoPDFDelegate

- (void)webHTMLtoPDFDidSucceed:(NGPDFViewController*)webHTMLtoPDF
{
    NSString *result = [NSString stringWithFormat:@"webHTMLtoPDF did succeed (%@ / %@)", webHTMLtoPDF, webHTMLtoPDF.PDFpath];
    NSLog(@"%@",result);
}

- (void)webHTMLtoPDFDidFail:(NGPDFViewController*)webHTMLtoPDF
{
    NSString *result = [NSString stringWithFormat:@"webHTMLtoPDF did fail (%@)", webHTMLtoPDF];
    NSLog(@"%@",result);
}


@end
