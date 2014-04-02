//
//  TOS_CheckinOps.m
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

#import "TOS_CheckinOps.h"
#import "TOSAccessOpCheckinAdd.h"
#import "TOSAccessOpCheckinGet.h"
#import "TOSAccessOpCheckinGet_Last.h"
#import "TOSAccessOpCheckinGet_Where.h"
#import "TOSAccessResCheckin.h"
#import "TOSAccessResCheckinCollection.h"
#import "TOS_CheckinCollection.h"
#import "TOSAccessCaller.h"

@implementation TOS_CheckinOps

NSString* methodcheck = @"GET";
NSString* formatcheck = @"json";
int versioncheck = 1;

/**
 * Adds the.
 *
 * @param POIID the poiid
 * @param timestamp the timestamp
 * @param accessTokenPregenerated the access token pregenerated
 * @return the checkin
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Checkin *) Add:(TOS_AccessTokenOAuth *) accessTokenPregenerated andPOIID:(int *) poiid andTimestamp:(NSDate *) timestamp{
    TOS_Checkin * checkin = nil;
    if ([accessTokenPregenerated isValid]) {
        TOSAccessOpCheckinAdd * checkinAdd = [[TOSAccessOpCheckinAdd alloc]initWithOperationName:@"Checkin_Add" andMethod:methodcheck andFormat:formatcheck andVersion:&versioncheck andOauth_token:[accessTokenPregenerated getAccessToken] andPoi:poiid andDevice:nil andTimestamp:timestamp];
        TOSAccessResCheckin * checkinResult= [[TOSAccessResCheckin alloc] init];
        
        
        [TOSAccessCaller ExecuteOperation:checkinAdd withResult:checkinResult];
        checkin= [checkinResult getCheckin];
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return checkin;
}

/**
 * Gets the.
 *
 * @param checkinID the checkin id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the checkin
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Checkin *) Get:(TOS_AccessTokenOAuth *) accessTokenPregenerated andCheckinID:(int *) checkinId{
    TOS_Checkin * checkin = nil;
    if ([accessTokenPregenerated isValid]) {
        TOSAccessOpCheckinGet * checkinGet = [[TOSAccessOpCheckinGet alloc]initWithOperationName:@"Checkin_Get" andMethod:methodcheck andFormat:formatcheck andVersion:&versioncheck andOauth_token:[accessTokenPregenerated getAccessToken] andCheckin:checkinId];
        TOSAccessResCheckin * checkinResult= [[TOSAccessResCheckin alloc] init];
        
        
        [TOSAccessCaller ExecuteOperation:checkinGet withResult:checkinResult];
        checkin= [checkinResult getCheckin];
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return checkin;
}


/**
 * Gets the last.
 *
 * @param userID the user id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the checkin
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Checkin *) GetLast:(TOS_AccessTokenOAuth *) accessTokenPregenerated andUserid:(NSString *) userId{
    TOS_Checkin * checkin = nil;
    if ([accessTokenPregenerated isValid]) {
        TOSAccessOpCheckinGet_Last * checkinGet = [[TOSAccessOpCheckinGet_Last alloc]initWithOperationName:@"Checkin_Get_Last" andMethod:methodcheck andFormat:formatcheck andVersion:&versioncheck andOauth_token:[accessTokenPregenerated getAccessToken]andUser:userId];
        TOSAccessResCheckin * checkinResult= [[TOSAccessResCheckin alloc] init];
        
        
        [TOSAccessCaller ExecuteOperation:checkinGet withResult:checkinResult];
        checkin= [checkinResult getCheckin];
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return checkin;
}


/**
 * Gets the checkins.
 *
 * @param POIID the poiid
 * @param accessTokenPregenerated the access token pregenerated
 * @return the list
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(NSMutableArray *) GetPOI:(TOS_AccessTokenOAuth *) accessTokenPregenerated andPoiid:(int *) poiId  andInitdate:(NSDate *) initDate andEnddate:(NSDate*) endDate {
    NSMutableArray * checkins = nil;
    if ([accessTokenPregenerated isValid]) {
        TOSAccessOpCheckinGet_Where * checkinGet = [[TOSAccessOpCheckinGet_Where alloc]initWithOperationName:@"Checkin_Get_Where" andMethod:methodcheck andFormat:formatcheck andVersion:&versioncheck andOauth_token:[accessTokenPregenerated getAccessToken] andPoi:poiId andInitdate:initDate andEnddate:endDate];
        TOSAccessResCheckinCollection * checkinResult= [[TOSAccessResCheckinCollection alloc] init];
        
        
        [TOSAccessCaller ExecuteOperation:checkinGet withResult:checkinResult];
        TOS_CheckinCollection *checkinscol= [checkinResult getCheckinCollection];
        checkins=[checkinscol getCheckins];
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return checkins;
}

@end
