//
//  NGKeyChainManager.h
//  NG_SHA256KeyChain
//
//  Created by Nitin Gupta on 17/04/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NGKeyChainManager : NSObject 

/*!
 * @discussion Generic exposed method to search the keychain for a given value.  Limit one result per search
 * @param identifier A string value to create keychain
 * @return NSData
 */
+ (NSData *)searchKeychainCopyMatchingIdentifier:(NSString *)identifier;

/*!
 * @discussion Calls searchKeychainCopyMatchingIdentifier: and converts to a string value.
 * @param identifier A string value to create keychain
 * @return NSString Key Chain String Value
 */
+ (NSString *)keychainStringFromMatchingIdentifier:(NSString *)identifier;

/*!
 * @discussion  Simple method to compare a passed in Hash value with what is stored in the keychain.Optionally, we could adjust this method to take in the keychain key to look up the value
 * @return Result Bool status
 */
+ (BOOL)compareKeychainValueForMatchingPIN:(NSUInteger)pinHash  passWordKey:(NSString *)_passKey andUserName:(NSString *)_userName ;

/*!
 * @discussion Default initializer to store a value in the keychain. Associated properties are handled for you (setting Data Protection Access, Company Identifer (to uniquely identify string, etc).
 * @return Result Status
 */
+ (BOOL)createKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier;

/*!
 * @discussion Updates a value in the keychain.  If you try to set the value with createKeychainValue: and it already exists this method is called instead to update the value in place.
 * @return Result Status
 */
+ (BOOL)updateKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier;

/*!
 * @discussion Delete a value in the keychain
 */
+ (void)deleteItemFromKeychainWithIdentifier:(NSString *)identifier;

/*!
 * @discussion Generates an SHA256 (much more secure than MD5) Hash
 */
+ (NSString *)securedSHA256DigestHashForPIN:(NSUInteger)pinHash andUserName:(NSString *)_userName;

/*!
 * @discussion Generates an SHA256 (much more secure than MD5) Hash
 */
+ (NSString*)computeSHA256DigestForString:(NSString*)input;

@end
