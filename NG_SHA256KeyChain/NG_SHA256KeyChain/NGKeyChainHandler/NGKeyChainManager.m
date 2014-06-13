//
//  NGKeyChainManager.m
//  NG_SHA256KeyChain
//
//  Created by Nitin Gupta on 17/04/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGKeyChainManager.h"
#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
#import "NGKeyChainConstant.h"

@implementation NGKeyChainManager


+ (NSMutableDictionary *)setupSearchDirectoryForIdentifier:(NSString *)identifier {
    
    NSMutableDictionary *searchDictionary = [[NSMutableDictionary alloc] init];
    [searchDictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [searchDictionary setObject:APP_NAME forKey:(__bridge id)kSecAttrService];
    NSData *encodedIdentifier = [identifier dataUsingEncoding:NSUTF8StringEncoding];
    [searchDictionary setObject:encodedIdentifier forKey:(__bridge id)kSecAttrGeneric];
    [searchDictionary setObject:encodedIdentifier forKey:(__bridge id)kSecAttrAccount];
	
    return searchDictionary;
}

+ (NSData *)searchKeychainCopyMatchingIdentifier:(NSString *)identifier {
    
    NSMutableDictionary *searchDictionary = [self setupSearchDirectoryForIdentifier:identifier];
    [searchDictionary setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
	
    [searchDictionary setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
	
    NSData *result = nil;
    CFTypeRef foundDict = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)searchDictionary, &foundDict);
    
    if (status == noErr) {
        result = (__bridge_transfer NSData *)foundDict;
    } else {
        result = nil;
    }
    
    return result;
}

+ (NSString *)keychainStringFromMatchingIdentifier:(NSString *)identifier {
    NSData *valueData = [self searchKeychainCopyMatchingIdentifier:identifier];
    if (valueData) {
        NSString *value = [[NSString alloc] initWithData:valueData encoding:NSUTF8StringEncoding];
        return value;
    } else {
        return nil;
    }
}

+ (BOOL)createKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier {
    
    NSMutableDictionary *dictionary = [self setupSearchDirectoryForIdentifier:identifier];
    NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
    [dictionary setObject:valueData forKey:(__bridge id)kSecValueData];
    
    [dictionary setObject:(__bridge id)kSecAttrAccessibleWhenUnlocked forKey:(__bridge id)kSecAttrAccessible];
    
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)dictionary, NULL);
	
    if (status == errSecSuccess) {
        return YES;
    } else if (status == errSecDuplicateItem){
        return [self updateKeychainValue:value forIdentifier:identifier];
    } else {
        return NO;
    }
}

+ (BOOL)updateKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier {
    
    NSMutableDictionary *searchDictionary = [self setupSearchDirectoryForIdentifier:identifier];
    NSMutableDictionary *updateDictionary = [[NSMutableDictionary alloc] init];
    NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
    [updateDictionary setObject:valueData forKey:(__bridge id)kSecValueData];
	
    // Update
    OSStatus status = SecItemUpdate((__bridge CFDictionaryRef)searchDictionary, (__bridge CFDictionaryRef)updateDictionary);
	
    if (status == errSecSuccess) {
        return YES;
    } else {
        return NO;
    }
}

+ (void)deleteItemFromKeychainWithIdentifier:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [self setupSearchDirectoryForIdentifier:identifier];
    CFDictionaryRef dictionary = (__bridge CFDictionaryRef)searchDictionary;
    SecItemDelete(dictionary);
}


+ (BOOL)compareKeychainValueForMatchingPIN:(NSUInteger)pinHash  passWordKey:(NSString *)_passKey andUserName:(NSString *)_userName {
    
    NSString *_savedString = [self keychainStringFromMatchingIdentifier:_passKey];
    NSString *_enteredString = [self securedSHA256DigestHashForPIN:pinHash andUserName:_userName];
    return [_savedString isEqualToString: _enteredString];
}

// The algorthim ("Digest Authentication") we are using is 'Hash = SHA256(Name + Salt + (Hash(PIN)))'.
+ (NSString *)securedSHA256DigestHashForPIN:(NSUInteger)pinHash andUserName:(NSString *)_userName {
    
    _userName = [_userName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *computedHashString = [NSString stringWithFormat:@"%@%lu%@", _userName, (unsigned long)pinHash, SALT_HASH];
    
    NSString *finalHash = [self computeSHA256DigestForString:computedHashString];
    NSLog(@"** Computed hash: %@ for SHA256 Digest: %@", computedHashString, finalHash);
    return finalHash;
}

+ (NSString*)computeSHA256DigestForString:(NSString*)input {
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}


@end
