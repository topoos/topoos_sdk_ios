//
//  TOSAccessResPOICategoryCollection.m
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
#import "TOSAccessResPOICategoryCollection.h"
#import "TOS_POICategoryCollection.h"
#import "TOS_POICategory.h"
#import "SBJSON.h"

@implementation TOSAccessResPOICategoryCollection

@synthesize Format,Error,Result,POICategoryCollection;

/**
 * Instantiates a new pOI category collection result.
 */
-(TOSAccessResPOICategoryCollection *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new pOI category collection result.
 *
 * @param error the error
 * @param result the result
 */
-(TOSAccessResPOICategoryCollection *) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new pOI category collection result.
 *
 * @param error the error
 * @param result the result
 * @param poiCategoryCollection the poi category collection
 */
-(TOSAccessResPOICategoryCollection *) initWithError: (NSString*) error andResult: (id) result andPOICategoryCollection: (TOS_POICategoryCollection *) poiCategoryCollection{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        POICategoryCollection=poiCategoryCollection;
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
    if (attributes != nil)
    {
        NSMutableArray * jarray;
        POICategoryCollection = [[TOS_POICategoryCollection alloc] init];
        jarray = [[NSMutableArray alloc]init];
        
        // Extracting content
        for (NSDictionary *job in attributes)
        {
            [jarray addObject: [self parsePOICategory: job]];
        }
        
        [POICategoryCollection setCategories: jarray];
    }
}

/**
 * Parses the POI Category.
 * @param job the job
 * @return the POI Category
 * @throws TopoosException the topoos exception
 */
- (TOS_POICategory *) parsePOICategory: (NSDictionary *) job
{
    TOS_POICategory * poiCateg;
    int identifier;
    NSString * description;
    bool isSystem;
    
    if (job != nil) {
        // Extracting content
        poiCateg = [[TOS_POICategory alloc] init];
        identifier = [[job valueForKeyPath:@"Id"] integerValue];
        [poiCateg setIdentifier: identifier];
        description= [job valueForKeyPath:@"Description"];
        [poiCateg setDescription: description];
        isSystem = [[job valueForKeyPath:@"is_system_category"] boolValue];
        [poiCateg setIsSystem: isSystem];
    }
    
    return poiCateg;
}

/**
 * Gets the poi category collection.
 * @return the poiCategoryCollection
 */
- (TOS_POICategoryCollection *) getPoiCategoryCollection
{
    return POICategoryCollection;
}

/**
 * Sets the poi category collection.
 * @param poiCategoryCollection the poiCategoryCollection to set
 */
- (void) setPoiCategoryCollection: (TOS_POICategoryCollection *) poiCategoryCollection
{
    POICategoryCollection = poiCategoryCollection;
}


@end
