//
//  TOSPOIOps.h
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

#import <Foundation/Foundation.h>
#import "TOS_POI.h"
#import "TOS_AccessTokenOAuth.h"
#import "TOS_POICategory.h"


@interface TOS_POIOps : NSObject


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
    andPostal_code: (NSString *) postal_code andPhone:(NSString*) phone andTwitter: (NSString*) twitter;

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
+ (TOS_POI *) Get: (TOS_AccessTokenOAuth *) accessTokenPregenerated andPoiID: (int *) POIID;

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
                    andTotal:(int*) total;

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
                     andTotal:(int*) total;

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
       andPostal_code: (NSString *) postal_code andPhone:(NSString*) phone andTwitter: (NSString*) twitter;

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
andPOI:(int *) poi ;

@end