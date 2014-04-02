//
//  TOS_ResourcesOps.h
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
#import "TOS_Rule.h"
#import "TOS_AccessTokenOAuth.h"


@interface TOS_ResourcesOps : NSObject

// The Constant DATA_TRACK.
extern NSString * const TOS_ACCESS_OP_TRACK_DATA_TRACK_ ;
// The Constant TYPE_LAYER.
extern NSString * const TOS_ACCESS_OP_TRACK_TYPE_LAYER_;
// The Constant EXPORT_FORMAT_KML.
extern NSString * const TOS_ACCESS_OP_TRACK_EXPORT_FORMAT_KML_;
// The Constant EXPORT_FORMAT_JSON.
extern NSString * const TOS_ACCESS_OP_TRACK_EXPORT_FORMAT_JSON_;

/**
 *
 * @param resolution
 * @param latCenter
 * @param lngCenter
 * @param radius
 * @param accessTokenPregenerated
 * @return List<Location>
 * @throws IOException
 * @throws TopoosException
 */

+ (NSMutableArray *) GetCircle: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                 andResolution: (int *) resolution andLatitude: (float *) lat andLongitude: (float *) lng andRadius: (float *) radius
;


/**
 *
 * @param lat
 * @param lng
 * @param accessTokenPregenerated
 * @return List<GeocodingData>
 * @throws IOException
 * @throws TopoosException
 */
+ (NSMutableArray *) GetGeocode: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                    andLatitude: (float *) lat andLongitude: (float *) lng
;


/**
 *
 * @param resourceID
 * @param type
 * @param format
 * @param apiKey
 * @return Track
 * @throws TopoosException
 * @throws IOException
 */
+ (NSString *) GetTrackExportedwithResourceId: (int *) resourceId
                        andType: (NSString *) type andFormat: (NSString *) format andApi_Key: (NSString *) api_key
;



@end
