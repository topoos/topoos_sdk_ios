//
//  TOSAccessResGeneric.m
//  SDKtopoos
//
/**
 * Copyright 2014-present topoos
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "TOSAccessResGeneric.h"
#import "SBJSON.h"

@implementation TOSAccessResGeneric

@synthesize Format,Error,Result,Code, Description;

/**
 * Instantiates a new generic result.
 */
-(TOSAccessResGeneric *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new generic result.
 *
 * @param error the error
 * @param result the result
 */
-(TOSAccessResGeneric *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new generic result.
 *
 * @param error the error
 * @param result the result
 * @param poiCategory the poi category
 */
-(TOSAccessResGeneric *) initWithError: (NSString*) error andResult: (id) result
                               andCode: (int ) cod andDescription: (NSString *) desc{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        Code = cod;
        Description = desc;
    }
    return self;
}

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters
{        
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        Code = [[attributes valueForKeyPath:@"code"] intValue];
        Description = [attributes valueForKeyPath:@"description"];
    }
}

/**
 * Gets the code.
 * @return the code
 */
- (int ) getCode
{
    return Code;
}

/**
 * Sets the code.
 * @param code the code to set
 */
- (void) setCode: (int ) code
{
    Code = code;
}

/**
 * Gets the Description.
 * @return the Description
 */
- (NSString *) getDescription
{
    return Description;
}

/**
 * Sets the Description.
 * @param desc the Description to set
 */
- (void) setDescription: (NSString *) desc
{
    Description = desc;
}

@end
