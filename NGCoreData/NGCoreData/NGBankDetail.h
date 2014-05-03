//
//  NGBankDetail.h
//  NGCoreData
//
//  Created by Nitin Gupta on 02/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NGAccountDetail;

@interface NGBankDetail : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NGAccountDetail *details;

@end
