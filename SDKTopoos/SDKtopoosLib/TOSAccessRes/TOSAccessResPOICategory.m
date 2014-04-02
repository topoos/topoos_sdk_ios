//
//  TOSAccessResPOICategory.m
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

#import "TOSAccessResPOICategory.h"
#import "SBJSON.h"

@implementation TOSAccessResPOICategory

@synthesize Format,Error,Result,POICategory;

/**
 * Instantiates a new pOI category result.
 */
-(TOSAccessResPOICategory *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new pOI category result.
 *
 * @param error the error
 * @param result the result
 */
-(TOSAccessResPOICategory *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new pOI category result.
 *
 * @param error the error
 * @param result the result
 * @param poiCategory the poi category
 */
-(TOSAccessResPOICategory *) initWithError: (NSString*) error andResult: (id) result andPOICategory: (TOS_POICategory *) poiCategory{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        POICategory=poiCategory;
    }
    return self;
}

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters
{
    int identifier;
    NSString * descr;
    bool isSystem;
    
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        POICategory = [[TOS_POICategory alloc] init];
        identifier = [[attributes valueForKeyPath:@"Id"] integerValue];
        [POICategory setIdentifier: identifier];
        descr = [attributes valueForKeyPath:@"Description"];
        [POICategory setDescription: descr];
        isSystem = [[attributes valueForKeyPath:@"is_system_category"] boolValue];
        [POICategory setIsSystem: isSystem];
    }
}

/**
 * Gets the poi category.
 * @return the poiCategory
 */
- (TOS_POICategory *) getPoiCategory
{
    return POICategory;
}

/**
 * Sets the poi category.
 * @param poiCategory the poiCategory to set
 */
- (void) setPoiCategory: (TOS_POICategory *) poiCategory
{
    POICategory = poiCategory;
}

@end
