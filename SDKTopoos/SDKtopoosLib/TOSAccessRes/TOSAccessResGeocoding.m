//
//  TOSAccessResGeocoding.m
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

#import "TOSAccessResGeocoding.h"
#import "SBJSON.h"


@implementation TOSAccessResGeocoding

@synthesize Format,Error,Result,Geocoding;

/**
 * Instantiates a new checkin collection result.
 */
-(TOSAccessResGeocoding *) init{
    self=[super init];
    return self;
}

/**
 * Instantiates a new checkin collection result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResGeocoding *) initWithError: (NSString*) error andResult: (id) result{
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
 * @param error
 *            the error
 * @param result
 *            the result
 * @param Geocoding data array
 *            the TOS_GeocodingData collection
 */
-(TOSAccessResGeocoding *) initWithError: (NSString*) error andResult: (id) result andGeocodingDataCollection: (NSMutableArray *) geocodingDataCollection{
    self=[super init];
    if(self){
        Error=error;
        Result=result;
        Geocoding=geocodingDataCollection;
    }
    return self;
}

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters{
    NSMutableArray * arrayGeocodingData;
    
    SBJSON *parser = [[SBJSON alloc] init];
    NSDictionary *attributes = [parser objectWithString:Result error:nil];
    if (attributes != nil)
    {
        arrayGeocodingData = [[NSMutableArray alloc]init];
        
        // Extracting content
        for (NSDictionary *job in attributes)
        {
            [arrayGeocodingData addObject: [self parseGeocodingData: job]];
        }
    }
    
    Geocoding=arrayGeocodingData;
}

- (TOS_GeocodingData *) parseGeocodingData: (NSDictionary *) job
{
    
    TOS_GeocodingData * geoData;
    TOS_Address * address;
    TOS_Location * location;
    TOS_ViewportType * bounds;
    TOS_Location * northeast;
    TOS_Location * southwest;
    
    NSNumber * latitude;
    NSNumber * longitude;
    NSNumber * ne_latitude;
    NSNumber * ne_longitude;
    NSNumber * sw_latitude;
    NSNumber * sw_longitude;

    
    
    if (job != nil) {
        // Extracting content
        //Address
        NSDictionary *jAddress=[job valueForKey:@"address"];
        if(jAddress!=nil && jAddress!=[NSNull null]){
            address=[[TOS_Address alloc] init];
            [address setAddress:[jAddress valueForKey:@"address"]];
            [address setAdministrative_area:[jAddress valueForKey:@"administrative_area"]];
            [address setCountry:[jAddress valueForKey:@"country"]];
            [address setCross_street:[jAddress valueForKey:@"cross_street"]];
            [address setPostal_code:[jAddress valueForKey:@"postal_code"]];
            [address setState:[jAddress valueForKey:@"state"]];
        }
        //Location
         NSDictionary *jLocation=[job valueForKey:@"location"];
        if(jLocation!=nil && jLocation!=[NSNull null]){
            location=[[TOS_Location alloc]init];
            latitude = [[NSNumber alloc] initWithFloat:[[jLocation valueForKeyPath:@"latitude"] floatValue] ];
            
            longitude = [[NSNumber alloc] initWithFloat:[[jLocation valueForKeyPath:@"longitude"] floatValue] ];
            [location setLatitude:latitude];
            [location setLongitude:longitude];
        }
        //Bounds
        NSDictionary *jBounds=[job valueForKey:@"bounds"];
        NSDictionary *jSouthWest=nil;
        NSDictionary *jNorthEast=nil;
        if(jBounds!=nil && jBounds!=[NSNull null]){
            jSouthWest=[jBounds valueForKey:@"southwest"];
            jNorthEast=[jBounds valueForKey:@"northeast"];
        }
        if(jSouthWest!=nil && jNorthEast!=nil){
            bounds=[[TOS_ViewportType alloc]init];
            
            northeast=[[TOS_Location alloc]init];
            ne_latitude = [[NSNumber alloc] initWithFloat:[[jNorthEast valueForKeyPath:@"latitude"] floatValue] ];
            ne_longitude = [[NSNumber alloc] initWithFloat:[[jNorthEast valueForKeyPath:@"longitude"] floatValue] ];
            [northeast setLatitude:ne_latitude];
            [northeast setLongitude:ne_longitude];
            
            southwest=[[TOS_Location alloc]init];
            sw_latitude = [[NSNumber alloc] initWithFloat:[[jSouthWest valueForKeyPath:@"latitude"] floatValue] ];
            sw_longitude = [[NSNumber alloc] initWithFloat:[[jSouthWest valueForKeyPath:@"longitude"] floatValue] ];
            [southwest setLatitude:sw_latitude];
            [southwest setLongitude:sw_longitude];
            
            [bounds setNortheast:northeast];
            [bounds setSouthwest:southwest];
        }
    geoData= [[TOS_GeocodingData alloc]initWithAddress:address andLocation:location andBounds:bounds];
    
    }
    return geoData;
}



/**
 * @return the geocoding
 */
-(NSMutableArray *) getGeocoding {
    return Geocoding;
}



/**
 * @param geocoding the geocoding to set
 */
-(void) setGeocoding:(NSMutableArray *) geocoding {
    Geocoding = geocoding;
}





@end
