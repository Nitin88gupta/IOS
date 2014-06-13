//
//  NGKeyChainConstant.h
//  NG_SHA256KeyChain
//
//  Created by Nitin Gupta on 17/04/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>


// Used to help secure the PIN
// Ideally, this is randomly generated, but to avoid unneccessary complexity and overhead of storing the Salt seperately we will standardize on this key.
// !!KEEP IT A SECRET!!
#define SALT_HASH @"TvgblckPOIsgLLx1v3P8TGRyVHaSOB1pvfm02wvGadj7RLHV8GrfxaZ84oGA8RsKdNRpxdAojXYg9iAj"


// Used to specify the Application
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
