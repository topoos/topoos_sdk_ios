//
//  TOSAccessResPOIWarning.m
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

#import "TOSAccessResPOIWarning.h"
#import "TOS_POIWarningData.h"
#import "TOS_POICategory.h"
#import "JSON.h"

@implementation TOSAccessResPOIWarning

@synthesize PoiWarning, Error, Result;

/**
 * Instantiates a new POIWarning result.
 */
- (TOSAccessResPOIWarning *) init
{
    self=[super init];
    return self;
}

/**
 * Instantiates a new POIWarning result.
 *
 * @param error the error
 * @param result the result
 */
- (TOSAccessResPOIWarning *) initWithError: (NSString*) error andResult: (NSString*) result
{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new POIWarning result.
 *
 * @param error the error
 * @param result the result
 * @param pos the position
 */
- (TOSAccessResPOIWarning *) initWithError: (NSString*) error andResult: (NSString*) result andPosition: (TOS_POIWarning*) poiw
{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        PoiWarning = poiw;
    }
    return self;
}

/**
 * Gets the poi warning.
 * @return the poi warning
 */
- (TOS_POIWarning *) getPoiWarning
{
    return PoiWarning;
}

/**
 * Sets the poi warning.
 * @param poiw the poi warning to set
 */
- (void) setPoiWarning: (TOS_POIWarning *) poiw
{
    PoiWarning = poiw;
}

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters
{
    int identifier;
    int poi_id;
    NSString * type;
    NSString * user_id;
    NSDate * timestamp;
    TOS_POIWarningData * data = nil;
    int id_warningdata;
    NSNumber * latitude;
    NSNumber *longitude;
    NSNumber *elevation;
    NSNumber *accuracy;
    NSNumber *vaccuracy;
    NSString * name;
    NSString * address;
    NSString * cross_street;
    NSString * city;
    NSString * country;
    NSString * postal_code;
    NSString * phone;
    NSString * twitter;
    NSString * description;
    NSMutableArray * categories;
    
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil)
    {
        // Extracting content
        PoiWarning = [[TOS_POIWarning alloc] init];
        
        identifier = [[attributes valueForKeyPath:@"id"] integerValue];
        [PoiWarning setIdentifier: identifier];
        poi_id = [[attributes valueForKeyPath:@"poi_id"] integerValue];
        [PoiWarning setPoiId: poi_id];
        type= [attributes valueForKeyPath:@"type"];
        [PoiWarning setType: type];
        user_id= [attributes valueForKeyPath:@"user_id"];
        [PoiWarning setUserId: user_id];
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

        timestamp = [formatter dateFromString:[attributes valueForKeyPath:@"timestamp"]];
        [PoiWarning setTimestamp: timestamp];

        NSDictionary * jObjectData = [attributes valueForKeyPath:@"data"];
        if(jObjectData!=nil && jObjectData!=[NSNull null])
        {
            data=[[TOS_POIWarningData alloc]init];
            
            id_warningdata = [[jObjectData valueForKeyPath:@"id"] integerValue];
            [data setIdentifier: id_warningdata];
            if([jObjectData valueForKeyPath:@"latitude"] !=[NSNull null]){
                latitude = [[NSNumber alloc] initWithFloat: [[jObjectData valueForKeyPath:@"latitude"] floatValue]];
            }
            [data setLatitude: latitude];
            if([jObjectData valueForKeyPath:@"longitude"] !=[NSNull null]){
            longitude = [[NSNumber alloc] initWithFloat:[[jObjectData valueForKeyPath:@"longitude"] floatValue]] ;
            }
            [data setLongitude: longitude];
            if([jObjectData valueForKeyPath:@"elevation"] !=[NSNull null]){
            elevation =[[NSNumber alloc] initWithFloat:[[jObjectData valueForKeyPath:@"elevation"] floatValue] ];
            }
            [data setElevation: elevation];
            if([jObjectData valueForKeyPath:@"accuracy"] !=[NSNull null]){
            accuracy =[[NSNumber alloc] initWithFloat:[[jObjectData valueForKeyPath:@"accuracy"] floatValue]];
            }
            [data setAccuracy: accuracy];
             if([jObjectData valueForKeyPath:@"vaccuracy"] !=[NSNull null]){
            vaccuracy =[[NSNumber alloc] initWithFloat:[[jObjectData valueForKeyPath:@"vaccuracy"] floatValue]];
             }
            [data setVaccuracy: vaccuracy];
            name = [jObjectData valueForKeyPath:@"name"];
            [data setName: name];
            address = [jObjectData valueForKeyPath:@"address"];
            [data setAddress: address];
            cross_street = [jObjectData valueForKeyPath:@"cross_street"];
            [data setCrossStreet: cross_street];
            city = [jObjectData valueForKeyPath:@"city"];
            [data setCity: city];
            country = [jObjectData valueForKeyPath:@"country"];
            [data setCountry: country];
            postal_code = [jObjectData valueForKeyPath:@"postal_code"];
            [data setPostalCode: postal_code];
            phone = [jObjectData valueForKeyPath:@"phone"];
            [data setPhone: phone];
            twitter = [jObjectData valueForKeyPath:@"twitter"];
            [data setTwitter: twitter];
            description = [jObjectData valueForKeyPath:@"description"];
            [data setDescription: description];
            
            
            categories=[[NSMutableArray alloc]init];
            NSDictionary * jArray = [data valueForKeyPath:@"categories"];
            if([jArray count] > 0)
            {
                for (NSDictionary *job in jArray)
                {
                    [categories addObject: [self parseCategory: job]];
                }
            }
            
            [data setCategories:categories];
        }
        
        [PoiWarning setData: data];
    }
}

/**
 * Parses the category.
 * @param job the job
 * @return the category
 * @throws TopoosException the topoos exception
 */
- (TOS_POICategory *) parseCategory: (NSDictionary *) job
{
    TOS_POICategory * category;
    
    int identifier;
    NSString * desc;
    bool isSystem;
    
    if (job != nil)
    {
        // Extracting content
        category = [[TOS_POICategory alloc] init];
        identifier = [[job valueForKeyPath:@"Id"] integerValue];
        [category setIdentifier: identifier];
        desc= [job valueForKeyPath:@"Description"];
        [category setDescription: desc];
        isSystem= [[job valueForKeyPath:@"is_system_category"] boolValue];
        [category setIsSystem:isSystem];
    }
    
    return category;
}


@end
