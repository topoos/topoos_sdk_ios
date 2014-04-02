//
//  TOSPOIOps.m
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

#import "TOS_POIOps.h"
#import "TOSAccessOpPOISAdd.h"
#import "TOSAccessOpPOISGet.h"
#import "TOSAccessOpPOISGet_near.h"
#import "TOSAccessOpPOISGet_where.h"
#import "TOSAccessOpPOISUpdate.h"
#import "TOSAccessOpPOISDelete.h"

#import "TOSAccessResPOI.h"
#import "TOSAccessResPOICollection.h"
#import "TOSAccessCaller.h"
#import "TOSAccessResGeneric.h"
@implementation TOS_POIOps

NSString* methodPOI = @"GET";
NSString* formatPOI = @"json";
int versionPOI = 1;



/**
 * Add a new point of interest (POI).Fields like address, cross_street,
 * city, country, and postalCode not specified, it will attempt to
 * automatically generate
 *
 * @param name
 *            (required) access_token to user resources
 * @param lat
 *            (required) latitude of the new position
 * @param lng
 *            (required) longitude of the new position.
 * @param categories
 *            (required) identifiers for the categories to which the POI
 *            belongs
 * @param accuracy
 *            (optional) accuracy of the position (latitude, longitude)
 * @param vaccuracy
 *            (optional) elevation accuracy
 * @param elevation
 *            (optional) elevation relative to sea level
 * @param desc
 *            (optional) description of the landmark
 * @param address
 *            (optional) direction of the point of interest
 * @param cross_street
 *            (optional) cross street
 * @param city
 *            (optional) city landmark
 * @param country
 *            (optional) country
 * @param postal_code
 *            (optional) postal code
 * @param phone
 *            (optional) Contact phone
 * @param twitter
 *            (optional) user ID or hashtag of Twitter
 * @param accessTokenPregenerated
 *            (required) access_token to user resources
 * @return POI
 * @throws IOException
 * @throws TopoosException
 */
+ (TOS_POI * ) Add: (TOS_AccessTokenOAuth *) accessTokenPregenerated
           andName: (NSString*) name andLatitude: (float*) lat andLongitude: (float*) lng andGeocode:(bool*) geocode andCategories: (NSMutableArray*) categories
       andAccuracy: (float*) accuracy andVaccuracy:(float*) vaccuracy andElevation: (float*) elevation andDescription: (NSString *)  desc
        andAddress:(NSString*) address andCross_street: (NSString *) cross_street andCity:(NSString *) city andCountry: (NSString*) country
    andPostal_code: (NSString *) postal_code andPhone:(NSString*) phone andTwitter: (NSString*) twitter{
    TOS_POI* POI=nil;
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil) {
        NSString * str_categories = @"";
        for(int i=0;i<[categories count];i++){
            if(i<[categories count]-1){
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:i] stringValue]];
                str_categories = [str_categories stringByAppendingString:@","];
            }
            else{
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:[categories count]-1] stringValue]];
            }
        }
        TOSAccessOpPOISAdd * opAdd= [[TOSAccessOpPOISAdd alloc] initWithOperationName:@"POI_Add" andMethod:methodPOI andFormat:formatPOI andVersion:&versionPOI andOauth_token:accessTokenPregenerated.getAccessToken andLat:lat andLng:lng andGeocode:geocode andAccuracy:accuracy andVaccuracy:vaccuracy andElevation:elevation andCategories:str_categories andName:name andDesc:desc andAddress:address andCross_street:cross_street andCity:city andCountry:country andPostal_code:postal_code andPhone:phone andTwitter:twitter];
        
        TOSAccessResPOI * resAdd= [[TOSAccessResPOI alloc] init];
        [TOSAccessCaller ExecuteOperation:opAdd withResult:resAdd];
        POI=[resAdd getPoi];
        
        
    }
    
    
    return POI;
}


/**
 * Gets information from a point of interest
 *
 * @param POIID
 *            (required) point of interest identifier
 * @param accessTokenPregenerated
 *            (required) access_token to user resources
 * @return POI
 * @throws IOException
 * @throws TopoosException
 */
+ (TOS_POI *) Get: (TOS_AccessTokenOAuth *) accessTokenPregenerated andPoiID: (int *) POIID{
    
    TOS_POI* POI=nil;
    if ([accessTokenPregenerated isValid]) {
        
        TOSAccessOpPOISGet * opGet= [[TOSAccessOpPOISGet alloc] initWithOperationName:@"POI_Get" andMethod:methodPOI andFormat:formatPOI andVersion:&versionPOI andOauth_token:[accessTokenPregenerated getAccessToken] andPoi:POIID];
        
        TOSAccessResPOI * respoi= [[TOSAccessResPOI alloc] init];
        
        [TOSAccessCaller ExecuteOperation:opGet withResult:respoi];
        POI=respoi.getPoi;
        
        
    }
    
    
    return POI;

}

/**
 * Gets a collection of points of interest near a location
 *
 * @param accessTokenPregenerated
 *            (required) access_token to user resources
 * @param lat
 *            (required) latitude of the new position
 * @param lng
 *            (required) longitude of the new position
 * @param radius
 *            (required) search radius in meters
 * @param categories
 *            (required) identifiers for the categories to which the POI
 *            belongs
 * @param total (optional) number of pois
 *
 * @return List<POI>
 * @throws IOException
 * @throws TopoosException
 */
+ (NSMutableArray *) GetNear:(TOS_AccessTokenOAuth *) accessTokenPregenerated
                 andLatitude: (float*) lat andLongitude: (float*) lng andRadius:(int*) radius andCategories: (NSMutableArray*) categories
andTotal:(int*) total{
    NSMutableArray * POIS=nil;
    if ([accessTokenPregenerated isValid]) {
        NSString * str_categories = @"";
        for(int i=0;i<[categories count];i++){
            if(i<[categories count]-1){
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:i] stringValue]];
                str_categories = [str_categories stringByAppendingString:@","];
            }
            else{
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:[categories count]-1] stringValue]];
            }
        }
        TOSAccessOpPOISGet_near * op= [[TOSAccessOpPOISGet_near alloc] initWithOperationName:@"POI_Get_near" andMethod:methodPOI andFormat:formatPOI andVersion:&versionPOI andOauth_token:accessTokenPregenerated.getAccessToken andLat:lat andLng:lng andRadius:radius andCategories:str_categories andTotal:total];
        
        TOSAccessResPOICollection * res= [[TOSAccessResPOICollection alloc] init];
        [TOSAccessCaller ExecuteOperation:op withResult:res];
        POIS= [[res getPoicollection] getPoiList];
        
        
    }
    return POIS;
    
}


/**
 * Gets a collection of collection of points filtering by various criteria
 *
 *
 * @param accessTokenPregenerated
 *            (required) access_token to user resources
 * @param categories
 *            (required) identifiers for the categories to which the POI
 *            belongs
 * @param POIS
 *            (optional) list of identifiers of POI you want to retrieve,
 *            separated by commas
 * @param city
 *            (optional) gets the POI in the city specified
 * @param country
 *            (optional) country
 * @param postal_code
 *            (optional) postal code
 * @param q
 *            (optional) gets the POI whose name or description matched the
 *            pattern
 * @param total (optional) number of pois
 *
 * @return List<POI>
 * @throws IOException
 * @throws TopoosException
 */
+ (NSMutableArray *) GetWhere:(TOS_AccessTokenOAuth *) accessTokenPregenerated
                andCategories: (NSMutableArray*) categories
andPOIS: (NSMutableArray*) pois
                      andCity:(NSString *) city andCountry: (NSString*) country
               andPostal_code: (NSString *) postal_code 
                 andQ: (NSString *) q
                    andTotal:(int*) total{
    NSMutableArray * POIS=nil;
    if ([accessTokenPregenerated isValid]) {
        NSString * str_categories = @"";
        for(int i=0;i<[categories count];i++){
            if(i<[categories count]-1){
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:i] stringValue]];
                str_categories = [str_categories stringByAppendingString:@","];
            }
            else{
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:[categories count]-1] stringValue]];
            }
        }
        NSString * str_pois = @"";
        for(int i=0;i<[pois count];i++){
            if(i<[categories count]-1){
                str_pois = [str_pois stringByAppendingString: [[pois objectAtIndex:i] stringValue]];
                str_pois = [str_pois stringByAppendingString:@","];
            }
            else{
                str_pois = [str_pois stringByAppendingString: [[pois objectAtIndex:[pois count]-1] stringValue]];
            }
        }
        TOSAccessOpPOISGet_where * op= [[TOSAccessOpPOISGet_where alloc] initWithOperationName:@"POI_Get_where" andMethod:methodPOI andFormat:formatPOI andVersion:&versionPOI andOauth_token:[accessTokenPregenerated getAccessToken] andPois:str_pois andCategories:str_categories andCity:city andCountry:country andPostalCode:postal_code andQ:q andTotal:total ];
        
        TOSAccessResPOICollection * res= [[TOSAccessResPOICollection alloc] init];
        [TOSAccessCaller ExecuteOperation:op withResult:res];
        POIS= [[res getPoicollection] getPoiList];
        
        
    }
    return POIS;
    
}

/**
 * Upgrade the point of interest with the new information provided. If you
 * want to erase a parameter must be included in the call, but without
 * providing a value (null).
 *
 * @param POIID
 *            (Can not be null) POI identifier we want to update
 * @param name
 *            (required) access_token to user resources
 * @param lat
 *            (required) latitude of the new position
 * @param lng
 *            (required) longitude of the new position
 * @param categories
 *            (required) identifiers for the categories to which the POI
 *            belongs
 * @param accuracy
 *            (optional) accuracy of the position (latitude, longitude)
 * @param vaccuracy
 *            (optional) elevation accuracy
 * @param elevation
 *            (optional) elevation relative to sea level
 * @param desc
 *            (optional) description of the landmark
 * @param address
 *            (optional) direction of the point of interest
 * @param cross_street
 *            (optional) cross street
 * @param city
 *            (optional) city landmark
 * @param country
 *            (optional) country
 * @param postal_code
 *            (optional) postal code
 * @param phone
 *            (optional) Contact phone
 * @param twitter
 *            (optional) user ID or hashtag of Twitter
 * @param accessTokenPregenerated
 *            (required) access_token to user resources
 * @return POI
 * @throws IOException
 * @throws TopoosException
 */
+ (TOS_POI * ) Update: (TOS_AccessTokenOAuth *) accessTokenPregenerated
               andPOI:(int *) poi
           andName: (NSString*) name andLatitude: (float*) lat andLongitude: (float*) lng andGeocode:(bool*) geocode andCategories: (NSMutableArray*) categories
       andAccuracy: (float*) accuracy andVaccuracy:(float*) vaccuracy andElevation: (float*) elevation andDescription: (NSString *)  desc
        andAddress:(NSString*) address andCross_street: (NSString *) cross_street andCity:(NSString *) city andCountry: (NSString*) country
    andPostal_code: (NSString *) postal_code andPhone:(NSString*) phone andTwitter: (NSString*) twitter{
    TOS_POI* POI=nil;
    if ([accessTokenPregenerated isValid]) {
        NSString * str_categories = @"";
        for(int i=0;i<[categories count];i++){
            if(i<[categories count]-1){
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:i] stringValue]];
                str_categories = [str_categories stringByAppendingString:@","];
            }
            else{
                str_categories = [str_categories stringByAppendingString: [[categories objectAtIndex:[categories count]-1] stringValue]];
            }
        }
        TOSAccessOpPOISUpdate * op= [[TOSAccessOpPOISUpdate alloc] initWithOperationName:@"POI_Update" andMethod:methodPOI andFormat:formatPOI andVersion:&versionPOI andOauth_token:[accessTokenPregenerated getAccessToken] andPoi:poi  andLat:lat andLng:lng andGeocode:geocode andAccuracy:accuracy andVaccuracy:vaccuracy andElevation:elevation andCategories:str_categories andName:name andDesc:desc andAddress:address andCross_street:cross_street andCity:city andCountry:country andPostal_code:postal_code andPhone:phone andTwitter:twitter];
        
        TOSAccessResPOI * res= [[TOSAccessResPOI alloc] init];
        [TOSAccessCaller ExecuteOperation:op withResult:res];
        POI=[res getPoi];
        
        
    }
    
    
    return POI;
}


/**
 * Deletes a point of interest
 *
 * @param POIID
 *            (Can not be null) POI identifier we want to update
 * @param accessTokenPregenerated
 *            (required) access_token to user resources
 * @return Boolean
 * @throws IOException
 * @throws TopoosException
 */
+(bool) Delete: (TOS_AccessTokenOAuth *) accessTokenPregenerated
         andPOI:(int *) poi {
    bool delete=false;
    if ([accessTokenPregenerated isValid]) {
        
        TOSAccessOpPOISDelete * op= [[TOSAccessOpPOISDelete alloc] initWithOperationName:@"POI_Delete" andMethod:methodPOI andFormat:formatPOI andVersion:&versionPOI andOauth_token:[accessTokenPregenerated getAccessToken] andPoi:poi];
        
        TOSAccessResGeneric * res= [[TOSAccessResGeneric alloc] init];
        [TOSAccessCaller ExecuteOperation:op withResult:res];
        int value=[res getCode];
        delete=(value== 200);
    }
    return delete;
}








@end
