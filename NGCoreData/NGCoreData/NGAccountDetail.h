//
//  NGAccountDetail.h
//  NGCoreData
//
//  Created by Nitin Gupta on 02/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NGBankDetail;

@interface NGAccountDetail : NSManagedObject

@property (nonatomic, retain) NSNumber * zip;
@property (nonatomic, retain) NSDate * closeDate;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, strong, readwrite) NGBankDetail *info;


@end
