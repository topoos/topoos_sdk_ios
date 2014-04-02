//
//  TOS_PositionsOps.m
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
#import "TOS_PositionsOps.h"
#import "TOSAccessOpPositionsAdd.h"
#import "TOSAccessOpPositionsGet.h"
#import "TOSAccessOpPositionsGet_Between.h"
#import "TOSAccessResPositions.h"
#import "TOSAccessResPositionsCollection.h"
#import "TOSAccessCaller.h"

@implementation TOS_PositionsOps


+ (TOS_Position *) AddPrivate: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                  andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                  andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                 andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
                      andType: (int) type
{
    TOS_Position * position = nil;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil) {
        
        // OPERATIONS
        int ver=1;
        TOSAccessOpPositionsAdd * positionsAdd =
        [[TOSAccessOpPositionsAdd alloc] initWithOperationName: @"Position_Add" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                andOauth_token: accessTokenPregenerated.getAccessToken andDevice: nil
                                                        andLat: lat andLng: lng andAccuracy: accuracy andVaccuracy: vaccuracy
                                                  andElevation: elevation andTimestamp: timestamp andVelocity: velocity
                                                    andPostype: &type andBearing: (float *) bearing andTrack: trackID];
        
        
        // RESULTS
        TOSAccessResPositions * positionResult = [[TOSAccessResPositions alloc] init];
        [TOSAccessCaller ExecuteOperation:positionsAdd withResult:positionResult];
        position = positionResult.getPosition;
        
    }
    else {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    return position;
}

/**
 * Register a new position. This may be an isolated position or the position
 * of an existing track.
 *
 * @param accessTokenPregenerated (required) access_token to user resources
 * @param lat (required) latitude in decimal degrees of the new position.
 * @param lng (required) longitude in decimal degrees of the new position.
 * @param trackID (optional) Track identifier to which the position
 * @param accuracy (optional) accuracy of the position (latitude, longitude)
 * @param vaccuracy (optional) elevation accuracy
 * @param elevation (optional) elevation relative to sea level
 * @param timestamp (optional) local time with UTC offset conversion capture the position
 * @param velocity (optional) movement speed at the moment that captured the position, in meters per second
 * @param bearing (optional) motion direction (value between 0 and 360)
 * @return Position
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */

+ (TOS_Position *) Add: (TOS_AccessTokenOAuth *) accessTokenPregenerated
           andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
           andAccuracy: (float *) accuracy andVaccuracy: (float *) vaccuracy andElevation: (float *) elevation
          andTimestamp: (NSDate *) timestamp andVelocity: (float *) velocity andBearing: (float *) bearing
{
    return [[self class] AddPrivate: accessTokenPregenerated andLatitude: lat andLongitude: lng andTrackId: trackID
                        andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                       andTimestamp: timestamp andVelocity: velocity andBearing: bearing
                            andType: TOS_ACCESS_OP_POSITIONS_ADD_POS];
}


+ (TOS_Position *) AddAlarmEnd: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                   andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                   andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                  andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddPrivate: accessTokenPregenerated andLatitude: lat andLongitude: lng andTrackId: trackID
                        andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                       andTimestamp: timestamp andVelocity: velocity andBearing: bearing
                            andType: TOS_ACCESS_OP_POSITIONS_ADD_ALARM_END];
}


+ (TOS_Position *) AddAlarmInit: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                    andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                    andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                   andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddPrivate: accessTokenPregenerated andLatitude: lat andLongitude: lng andTrackId: trackID
                        andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                       andTimestamp: timestamp andVelocity: velocity andBearing: bearing
                            andType: TOS_ACCESS_OP_POSITIONS_ADD_ALARM_INIT];
}


+ (TOS_Position *) AddGPSNo: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
               andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddPrivate: accessTokenPregenerated andLatitude: lat andLongitude: lng andTrackId: trackID
                        andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                       andTimestamp: timestamp andVelocity: velocity andBearing: bearing
                            andType: TOS_ACCESS_OP_POSITIONS_ADD_GPS_NO];
}


+ (TOS_Position *) AddGPSOk: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
               andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddPrivate: accessTokenPregenerated andLatitude: lat andLongitude: lng andTrackId: trackID
                        andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                       andTimestamp: timestamp andVelocity: velocity andBearing: bearing
                            andType: TOS_ACCESS_OP_POSITIONS_ADD_GPS_OK];
}


+ (TOS_Position *) AddTrackEnd: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                   andLatitude: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                   andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                  andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddPrivate: accessTokenPregenerated andLatitude: lat andLongitude: lng andTrackId: trackID
                        andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                       andTimestamp: timestamp andVelocity: velocity andBearing: bearing
                            andType: TOS_ACCESS_OP_POSITIONS_ADD_TRACK_END];
}


+ (TOS_Position *) Get: (TOS_AccessTokenOAuth *) accessTokenPregenerated
              andPosId: (int *) posID
{
    TOS_Position * position = nil;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil)
    {
        // OPERATIONS
        int ver=1;
        TOSAccessOpPositionsGet * positionsGet =
        [[TOSAccessOpPositionsGet alloc] initWithOperationName: @"Position_Get" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                andOauth_token: accessTokenPregenerated.getAccessToken andPosid: posID
                                                        andUsr: nil andDevice: nil];
        
        // RESULTS
        TOSAccessResPositions * positionResult = [[TOSAccessResPositions alloc] init];
        [TOSAccessCaller ExecuteOperation:positionsGet withResult:positionResult];
        position = positionResult.getPosition;
        
    }
    else
    {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    return position;
}


+ (TOS_Position *) GetLastUser: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                     andUserID: (NSString *) userID
{
    TOS_Position * position = nil;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil)
    {
        if(userID==nil){
            userID=@"me";
        }
        
        // OPERATIONS
        int ver=1;
        TOSAccessOpPositionsGet * positionsGet =
        [[TOSAccessOpPositionsGet alloc] initWithOperationName: @"Position_GetLastUser" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                andOauth_token: accessTokenPregenerated.getAccessToken andPosid: nil
                                                        andUsr: userID andDevice: nil];
        
        // RESULTS
        TOSAccessResPositions * positionResult = [[TOSAccessResPositions alloc] init];
        [TOSAccessCaller ExecuteOperation:positionsGet withResult:positionResult];
        position = positionResult.getPosition;
    }
    else
    {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    return position;
}


+ (NSMutableArray *) GetBetweenDays: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                        andInitDate: (NSDate *) initDate andEndDate: (NSDate *) endDate
{
    NSMutableArray * positions = nil;
    
    if (accessTokenPregenerated!=nil && accessTokenPregenerated.getAccessToken!=nil)
    {
        // OPERATIONS
        int ver=1;
        TOSAccessOpPositionsGet_Between * positionsGet_Between =
        [[TOSAccessOpPositionsGet_Between alloc] initWithOperationName: @"Position_AddTrackEnd" andMethod: @"GET" andFormat: @"json" andVersion: &ver
                                                        andOauth_token: accessTokenPregenerated.getAccessToken
                                                           andInitdate: initDate andEnddate: endDate
                                                             andDevice: nil];
        
        // RESULTS
        TOSAccessResPositionsCollection * positionResult = [[TOSAccessResPositionsCollection alloc] init];
        [TOSAccessCaller ExecuteOperation:positionsGet_Between withResult:positionResult];
        positions = positionResult.getPositions;

    }
    else
    {
        //throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    return positions;
}


// .....................................................................................................................................
// NOTA ................................................................................................................................
// PARA ESTOS SIGUIENTES MÉTODOS HAY QUE RECOGER EL TOS_AccessTokenOAuth PORQUE NO VIENE POR PARÁMETRO Y SE ESTÁ PASANDO nil
+ (TOS_Position *) Add: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
           andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
          andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] Add: nil andLatitude: lat andLongitude: lng andTrackId: trackID
                        andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                       andTimestamp: timestamp andVelocity: velocity andBearing: bearing];
}


+ (TOS_Position *) AddAlarmEnd: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                   andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                  andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddAlarmEnd: nil andLatitude: lat andLongitude: lng andTrackId: trackID
                 andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                andTimestamp: timestamp andVelocity: velocity andBearing: bearing];
}

+ (TOS_Position *) AddAlarmInit: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                    andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                   andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddAlarmInit: nil andLatitude: lat andLongitude: lng andTrackId: trackID
                         andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                        andTimestamp: timestamp andVelocity: velocity andBearing: bearing];
}


+ (TOS_Position *) AddGPSNo: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
               andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddGPSNo: nil andLatitude: lat andLongitude: lng andTrackId: trackID
                         andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                        andTimestamp: timestamp andVelocity: velocity andBearing: bearing];
}



+ (TOS_Position *) AddGPSOk: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
               andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddGPSOk: nil andLatitude: lat andLongitude: lng andTrackId: trackID
                         andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                        andTimestamp: timestamp andVelocity: velocity andBearing: bearing];
}



+ (TOS_Position *) AddTrackEnd: (float *) lat andLongitude: (float *) lng andTrackId: (int *) trackID
                   andAccuracy: (float *) accuracy andVaccuracy:(float *) vaccuracy andElevation: (float *) elevation
                  andTimestamp: (NSDate *) timestamp andVelocity:(float *) velocity andBearing:(float *) bearing
{
    return [[self class] AddTrackEnd: nil andLatitude: lat andLongitude: lng andTrackId: trackID
                         andAccuracy: accuracy andVaccuracy: vaccuracy andElevation: elevation
                        andTimestamp: timestamp andVelocity: velocity andBearing: bearing];
}


+ (TOS_Position *) Get: (int *) posID
{
    return [[self class] Get: nil andPosId: posID];
}


+ (TOS_Position *) GetLastUser: (NSString *) userID
{
    return [[self class] GetLastUser: nil andUserID: userID];
}


+ (NSMutableArray *) GetBetweenDays: (NSDate *) initDate andEndDate: (NSDate *) endDate
{
    return [[self class] GetBetweenDays: nil andInitDate: initDate andEndDate: endDate];
}


@end
