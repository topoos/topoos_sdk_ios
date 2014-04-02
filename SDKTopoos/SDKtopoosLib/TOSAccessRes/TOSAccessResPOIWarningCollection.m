//
//  TOSAccessResPOIWarningCollection.m
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

#import "TOSAccessResPOIWarningCollection.h"
#import "TOS_POIWarningData.h"
#import "TOS_POICategory.h"
#import "TOS_POIWarning_Count.h"
#import "TOS_POI.h"
#import "TOS_POIWarning.h"
#import "TOS_POIDataWarning.h"
#import "JSON.h"

@implementation TOSAccessResPOIWarningCollection

@synthesize POIDataWarnings, Result;

/**
 * Gets the poi warning.
 * @return the poi warning
 */
- (NSMutableArray *) getPOIDataWarnings
{
    return POIDataWarnings;
}

/**
 * Sets the poi warning.
 * @param poiw the poi warning to set
 */
- (void) setPOIDataWarnings: (NSMutableArray *) poidataw
{
    POIDataWarnings = poidataw;
}

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters
{
    NSMutableArray * arrayPOIDataWarnings;
    
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil)
    {
        arrayPOIDataWarnings = [[NSMutableArray alloc]init];
        
        // Extracting content
        for (NSDictionary *job in attributes)
        {
            [arrayPOIDataWarnings addObject: [self  parsePOIDataWarning: job]];
        }
    }
    
    POIDataWarnings = arrayPOIDataWarnings;
}

/**
 * Parses the POIDataWarning.
 * @param job the job
 * @return the position
 * @throws TopoosException the topoos exception
 */
- (TOS_POIDataWarning *) parsePOIDataWarning: (NSDictionary *) job
{
    TOS_POI * POI = [[TOS_POI alloc] init];
    NSMutableArray *arrayPOIWarnings=[[NSMutableArray alloc]init];

    NSDictionary * jPOI = [job valueForKeyPath:@"current"];
    if([jPOI count] > 0)
    {
        NSMutableArray *categories=[[NSMutableArray alloc]init];
        NSDictionary * jArrayCategories = [jPOI valueForKeyPath:@"categories"];
        for (NSDictionary *jCategory in jArrayCategories)
        {
            [categories addObject: [self parseCategory: jCategory]];
        }
        
        TOS_POIWarning_Count * warningcount = [[TOS_POIWarning_Count alloc] init];
        NSDictionary * jArrayWarnings = [jPOI valueForKeyPath:@"warnings"];
        if (jArrayWarnings != nil)
        {
            int closed;
            int duplicated;
            int wrongIndicator;
            int wrongInfo;
            
            // Extracting content
            closed = [[jArrayWarnings valueForKeyPath:@"closed"] integerValue];
            [warningcount setClosed:closed];
            duplicated = [[jArrayWarnings valueForKeyPath:@"duplicated"] integerValue];
            [warningcount setDuplicated:duplicated];
            wrongIndicator = [[jArrayWarnings valueForKeyPath:@"wrongIndicator"] integerValue];
            [warningcount setWrongIndicator:wrongIndicator];
            wrongInfo = [[jArrayWarnings valueForKeyPath:@"wrongInfo"] integerValue];
            [warningcount setWrongInfo:wrongInfo];
        }
        
        int  identifier;
        NSString * name;
        NSString * description;
        float  latitude;
        float  longitude;
        float  elevation;
        float  accuracy;
        float  vaccuracy;
        NSDate * registertime;
        NSString * address;
        NSString * crossStreet;
        NSString * city;
        NSString * country;
        NSString * postalCode;
        NSString * phone ;
        NSString * twitter ;
        NSDate * lastUpdate ;        
        // Extracting content
        identifier=[[jPOI valueForKeyPath:@"id"] integerValue];
        [POI setIdentifier:identifier];
        name= [jPOI valueForKeyPath:@"name"];
        [POI setName:name];
        description= [jPOI valueForKeyPath:@"description"];
        [POI setDescription:description];
        latitude = [[jPOI valueForKeyPath:@"latitude"] floatValue];
        [POI setLatitude:latitude];
        longitude = [[jPOI valueForKeyPath:@"longitude"] floatValue];
        [POI setLongitude:longitude];
        elevation = [[jPOI valueForKeyPath:@"elevation"] floatValue];
        [POI setElevation:elevation];
        accuracy = [[jPOI valueForKeyPath:@"accuracy"] floatValue];
        [POI setAccuracy:accuracy];
        vaccuracy = [[jPOI valueForKeyPath:@"vaccuracy"] floatValue];
        [POI setVaccuracy:vaccuracy];
        address= [jPOI valueForKeyPath:@"address"];
        [POI setAddress:address];
        crossStreet= [jPOI valueForKeyPath:@"crossStreet"];
        [POI setCrossStreet:crossStreet];
        city= [jPOI valueForKeyPath:@"city"];
        [POI setCity:city];
        country= [jPOI valueForKeyPath:@"country"];
        [POI setCountry:country];
        postalCode= [jPOI valueForKeyPath:@"postalCode"];
        [POI setCrossStreet:postalCode];
        phone= [jPOI valueForKeyPath:@"phone"];
        [POI setCrossStreet:phone];
        twitter= [jPOI valueForKeyPath:@"twitter"] ;
        [POI setCrossStreet:twitter];
        [POI setWarningcount:warningcount];
        [POI setCategories:categories];
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

        registertime = [formatter dateFromString:[jPOI valueForKeyPath:@"registertime"]];
        [POI setRegistertime:registertime];
        //lastUpdate= [formatter dateFromString:[jPOI valueForKeyPath:@"lastUpdate"]];
        //[POI setLastUpdate:lastUpdate];
    }
    
    NSDictionary * jArrayWarnings = [job valueForKeyPath:@"warnings"];
    if([jArrayWarnings count] > 0)
    {
        TOS_POIWarningData *poiWarningData = nil;
        
        for (NSDictionary *jPOIwarning in jArrayWarnings)
        {
            NSDictionary * jPOIwData = [jPOIwarning valueForKeyPath:@"data"];
            
            if(jPOIwData !=[NSNull null])
            {
                NSDictionary * jPOIwarningCategories = [jPOIwData valueForKeyPath:@"categories"];
                NSMutableArray *arrayCategories=[[NSMutableArray alloc]init];
                for (NSDictionary *jwCategory in jPOIwarningCategories)
                {
                    [arrayCategories addObject: [[self class] parseCategory: jwCategory]];
                }
                
                poiWarningData = [[TOS_POIWarningData alloc] init];
                
                int identifier ;
                NSNumber * latitude ;
                NSNumber * longitude ;
                NSNumber * elevation ;
                NSNumber * accuracy ;
                NSNumber * vaccuracy ;
                NSString * name ;
                NSString * description ;
                NSString * address ;
                NSString * cross_street ;
                NSString * city ;
                NSString * country ;
                NSString * postal_code ;
                NSString * phone ;
                NSString * twitter ;
                
                identifier = [[jPOIwData valueForKeyPath:@"id"] integerValue];
                latitude = [[NSNumber alloc] initWithFloat:[[jPOIwData valueForKeyPath:@"latitude"] floatValue] ];
                [poiWarningData setLatitude: latitude];
                longitude = [[NSNumber alloc] initWithFloat:[[jPOIwData valueForKeyPath:@"longitude"] floatValue]] ;
                [poiWarningData setLongitude: longitude];
                elevation =[[NSNumber alloc] initWithFloat:[[jPOIwData valueForKeyPath:@"elevation"] floatValue] ];
                [poiWarningData setElevation: elevation];
                accuracy =[[NSNumber alloc] initWithFloat:[[jPOIwData valueForKeyPath:@"accuracy"] floatValue]];
                [poiWarningData setAccuracy: accuracy];
                vaccuracy =[[NSNumber alloc] initWithFloat:[[jPOIwData valueForKeyPath:@"vaccuracy"] floatValue]];
                [poiWarningData setIdentifier: identifier];
                
                name= [jPOIwData valueForKeyPath:@"name"];
                [poiWarningData setName:name];
                description= [jPOIwData valueForKeyPath:@"description"];
                [poiWarningData setDescription:description];
                address= [jPOIwData valueForKeyPath:@"address"];
                [poiWarningData setAddress:address];
                cross_street= [jPOIwData valueForKeyPath:@"cross_street"];
                [poiWarningData setCrossStreet:cross_street];
                city= [jPOIwData valueForKeyPath:@"city"];
                [poiWarningData setCity:city];
                country= [jPOIwData valueForKeyPath:@"country"];
                [poiWarningData setCountry:country];
                postal_code= [jPOIwData valueForKeyPath:@"postal_code"];
                [poiWarningData setCrossStreet:postal_code];
                phone= [jPOIwData valueForKeyPath:@"phone"];
                [poiWarningData setCrossStreet:phone];
                twitter= [jPOIwData valueForKeyPath:@"twitter"] ;
                [poiWarningData setCrossStreet:twitter];
                [poiWarningData setCategories:arrayCategories];
            }
            
            TOS_POIWarning * poiwarning = [[TOS_POIWarning alloc] init];
            int identifier ;
            int poiId ;
            NSString * type ;
            NSString * userId ;
            NSDate * timestamp ;
            identifier = [[jPOIwarning valueForKeyPath:@"id"] integerValue];
            [poiwarning setIdentifier: identifier];
            poiId = [[jPOIwarning valueForKeyPath:@"poi_id"] integerValue];
            [poiwarning setPoiId: poiId];
            type= [jPOIwarning valueForKeyPath:@"type"];
            [poiwarning setType:type];
            userId= [jPOIwarning valueForKeyPath:@"user_id"];
            [poiwarning setUserId:userId];
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSZZZ"];

            timestamp = [formatter dateFromString:[jPOIwarning valueForKeyPath:@"timestamp"]];
            [poiwarning setTimestamp:timestamp];
            [poiwarning setData:poiWarningData];

            
            [arrayPOIWarnings addObject: poiwarning];
        }
    }

    
    TOS_POIDataWarning * poiDataWarning = [[TOS_POIDataWarning alloc] init];
    [poiDataWarning setPoi:POI];
    [poiDataWarning setPoiWarnings:arrayPOIWarnings];
    return poiDataWarning;
}

/**
 * Parses the category.
 * @param job the job
 * @return the category
 * @throws TopoosException the topoos exception
 */
- (TOS_POICategory *) parseCategory: (NSDictionary *) jCategory
{
    TOS_POICategory * category;
    
    if (jCategory != nil)
    {
        int identifier;
        NSString * desc;
        bool isSystem;

        // Extracting content
        category = [[TOS_POICategory alloc] init];
        identifier = [[jCategory valueForKeyPath:@"Id"] integerValue];
        [category setIdentifier: identifier];
        desc= [jCategory valueForKeyPath:@"Description"];
        [category setDescription: desc];
        isSystem= [[jCategory valueForKeyPath:@"is_system_category"] boolValue];
        [category setIsSystem:isSystem];
    }
    
    return category;
}

@end



