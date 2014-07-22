//
//  NGDataBaseManager.h
//  NGSqlDataBase
//
//  Created by Nitin Gupta on 06/05/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface NGDataBaseManager : NSObject {
    NSString *databasePath;
}

+(instancetype)getSharedInstance;
-(BOOL)initializeDataBase;
-(BOOL) saveData:(NSString*)registerNumber name:(NSString*)name
      department:(NSString*)department year:(NSString*)year;
-(NSArray*)findByRegisterNumber:(NSString*)registerNumber;


@end
