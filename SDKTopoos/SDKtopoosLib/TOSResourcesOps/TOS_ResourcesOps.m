//
//  TOS_ResourcesOps.m
//  SDKtopoos
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

#import "TOS_ResourcesOps.h"
#import "TOSAccessCaller.h"
#import "TOSAccessOpExportLayerTrack.h"
#import "TOSAccessOpResource.h"
#import "TOSAccessOpResourcesGeocode.h"
#import "TOSAccessOpResourcesGet_Polygon.h"
#import "TOSAccessResPolygon.h"
#import "TOSAccessResGeocoding.h"
#import "TOSAccessResTrackExport.h"


@implementation TOS_ResourcesOps


NSString* methodresources = @"GET";
NSString* formatresources = @"json";
int versionresources = 1;

// The Constant DATA_TRACK.
NSString * const TOS_ACCESS_OP_TRACK_DATA_TRACK_ = @"Track";
// The Constant TYPE_LAYER.
NSString * const TOS_ACCESS_OP_TRACK_TYPE_LAYER_ = @"layer";
// The Constant EXPORT_FORMAT_KML.
NSString * const TOS_ACCESS_OP_TRACK_EXPORT_FORMAT_KML_ = @"kml";
// The Constant EXPORT_FORMAT_JSON.
NSString * const TOS_ACCESS_OP_TRACK_EXPORT_FORMAT_JSON_ = @"json";

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
{
    NSMutableArray * arraylocations = nil;
    
    if ([accessTokenPregenerated isValid]) {
        
        // OPERATIONS
        TOSAccessOpResourcesGet_Polygon * op =[[TOSAccessOpResourcesGet_Polygon alloc] initWithOperationName:@"Get_Polygon" andMethod:methodresources andFormat:formatresources andVersion:&versionresources andOauth_token:[accessTokenPregenerated getAccessToken] andShape:@"circle" andResolution:resolution andLat:lat andLng:lng andRadius:radius];
        
        // RESULTS
        TOSAccessResPolygon * result = [[TOSAccessResPolygon alloc] init];
        [TOSAccessCaller ExecuteOperation:op withResult:result];
        arraylocations = result.getPolygon;
        
    }
    else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    
    return arraylocations;
}


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
{
    NSMutableArray * arraygeocode = nil;
    
    if ([accessTokenPregenerated isValid]) {
        
        // OPERATIONS
        TOSAccessOpResourcesGeocode * op =[[TOSAccessOpResourcesGeocode alloc]  initWithOperationName:@"GetGeocode" andMethod:methodresources andFormat:formatresources andVersion:&versionresources andOauth_token:[accessTokenPregenerated getAccessToken] andLatitude:lat andLongitude:lng];
        
        // RESULTS
        TOSAccessResGeocoding * result = [[TOSAccessResGeocoding alloc] init];
        [TOSAccessCaller ExecuteOperation:op withResult:result];
        arraygeocode = [result getGeocoding];
        
    }
    else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    
    return arraygeocode;
}


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
{
    NSString * exportedTrack = nil;
    
        
        // OPERATIONS
        TOSAccessOpResource * op =[[TOSAccessOpResource alloc]  initWithOperationName:@"GetTrackExported" andMethod:methodresources andFormat:formatresources andVersion:&versionresources andType:type andApi_Key:api_key andIdentifier:resourceId];
        
        // RESULTS
        TOSAccessResTrackExport * result = [[TOSAccessResTrackExport alloc] init];
        [TOSAccessCaller ExecuteOperation:op withResult:result];
        exportedTrack = [result getTrackResource];

    
    return exportedTrack;
}


@end
