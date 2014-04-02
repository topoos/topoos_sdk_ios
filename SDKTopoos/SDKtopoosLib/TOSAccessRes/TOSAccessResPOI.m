//
//  TOSAccessResPOI.m
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

#import "TOSAccessResPOI.h"
#import "JSON.h"

@implementation TOSAccessResPOI
/** The poi. */
@synthesize  POI,Error,Result,Format ;

/**
 * Instantiates a new pOI result.
 */
-(TOSAccessResPOI *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new pOI result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResPOI*) initWithError: (NSString*) error andResult: (id) result{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
    }
    return self;
}

/**
 * Instantiates a new pOI result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param poi
 *            the poi
 */
-(TOSAccessResPOI*) initWithError: (NSString*) error andResult: (id) result andPOI: (TOS_POI*) poi{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        POI=poi;
    }
    return self;
}
/**
 * Gets the poi.
 *
 * @return the poi
 */
- (TOS_POI *) getPoi{
    return POI;
}

/**
 * Sets the poi.
 *
 * @param poi
 *            the poi to set
 */
-(void) setPoi:(TOS_POI* ) poi {
    POI=poi;
}

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters{
    // TODO Auto-generated method stub
    int  iden;
    NSString * name;
    NSString * description;
    float  latitude;
    float  longitude;
    float  elevation;
    float  accuracy;
    float  vaccuracy;
    NSDate * registertime;
    NSMutableArray *categories;
    NSString * address;
    NSString * crossStreet;
    NSString * city;
    NSString * country;
    NSString * postalCode;
    NSString * phone ;
    NSString * twitter ;
    NSDate * lastUpdate ;
    TOS_POIWarning_Count * warningcount;
    
   
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil) {
        // Extracting content
        POI= [[TOS_POI alloc] init];
        iden=[[attributes valueForKeyPath:@"id"] intValue];
        [POI setIdentifier:iden];
        name= [attributes valueForKeyPath:@"name"];
        [POI setName:name];
        description= [attributes valueForKeyPath:@"description"];
        [POI setDescription:description];
        latitude = [[attributes valueForKeyPath:@"latitude"] floatValue];
        [POI setLatitude:latitude];
        longitude = [[attributes valueForKeyPath:@"longitude"] floatValue];
        [POI setLongitude:longitude];
        elevation = [[attributes valueForKeyPath:@"elevation"] floatValue];
        [POI setElevation:elevation];
        accuracy = [[attributes valueForKeyPath:@"accuracy"] floatValue];
        [POI setAccuracy:accuracy];
        vaccuracy = [[attributes valueForKeyPath:@"Vaccuracy"] floatValue];
        [POI setVaccuracy:vaccuracy];
        address= [attributes valueForKeyPath:@"Address"];
        [POI setAddress:address];
        crossStreet= [attributes valueForKeyPath:@"cross_street"];
        [POI setCrossStreet:crossStreet];
        city= [attributes valueForKeyPath:@"city"];
        [POI setCity:city];
        country= [attributes valueForKeyPath:@"country"];
        [POI setCountry:country];
        
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

        registertime = [formatter dateFromString:[attributes valueForKeyPath:@"registertime"]];
        [POI setRegistertime:registertime];
        lastUpdate= [formatter dateFromString:[attributes valueForKeyPath:@"last_update"]];
        [POI setLastUpdate:lastUpdate];
        postalCode= [attributes valueForKeyPath:@"postal_code"];
        [POI setCrossStreet:postalCode];
        phone= [attributes valueForKeyPath:@"phone"];
        [POI setCrossStreet:phone];
        twitter= [attributes valueForKeyPath:@"twitter"] ;
        [POI setCrossStreet:twitter];
        
        warningcount=[[TOS_POIWarning_Count alloc] init];
        
        NSDictionary * warning = [attributes valueForKeyPath:@"warnings"];
        int closed=[[warning valueForKeyPath:@"closed"] integerValue];
        [warningcount setClosed:closed];
        int duplicated=[[warning valueForKeyPath:@"duplicated"] integerValue];
        [warningcount setDuplicated:duplicated];
        int wrong_indicator=[[warning valueForKeyPath:@"wrong_indicator"] integerValue];
        [warningcount setWrongIndicator:wrong_indicator];
        int wrong_info=[[warning valueForKeyPath:@"wrong_info"] integerValue];
        [warningcount setWrongInfo:wrong_info];
        [POI setWarningcount:warningcount];
        
        
        
        categories = [[NSMutableArray alloc]init ];

        //NSDictionary *attributes2 = [parser objectWithString:Result error:nil];
        for (NSDictionary *category in[attributes valueForKeyPath:@"categories"] ){
            TOS_POICategory *poi_category = [[TOS_POICategory alloc]init ];
            NSString * descriptionCategory=[category valueForKeyPath:@"Description"];
            [poi_category setDescription:descriptionCategory];
            bool  isSystem= [[category valueForKeyPath:@"is_system_category"] boolValue];
            [poi_category setIsSystem:isSystem];
            int  identifier= [[category valueForKeyPath:@"Id"] integerValue];
            [poi_category setIdentifier:identifier];
            
            [categories addObject:poi_category];
        }
        [POI setCategories:categories];

    }
}




@end
