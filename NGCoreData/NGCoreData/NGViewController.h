//
//  NGViewController.h
//  NGCoreData
//
//  Created by Nitin Gupta on 02/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGViewController : UIViewController

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,strong) NSArray* bankInfos;

@end
