//
//  TOS_CheckinOps.h
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
#import "TOS_Checkin.h"
#import "TOS_AccessTokenOAuth.h"

@interface TOS_CheckinOps : NSObject

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
+ (TOS_Checkin *) Add:(TOS_AccessTokenOAuth *) accessTokenPregenerated andPOIID:(int *) poiid andTimestamp:(NSDate *) timestamp;

/**
 * Gets the.
 *
 * @param checkinID the checkin id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the checkin
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Checkin *) Get:(TOS_AccessTokenOAuth *) accessTokenPregenerated andCheckinID:(int *) checkinId;


/**
 * Gets the last.
 *
 * @param userID the user id
 * @param accessTokenPregenerated the access token pregenerated
 * @return the checkin
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(TOS_Checkin *) GetLast:(TOS_AccessTokenOAuth *) accessTokenPregenerated andUserid:(NSString *) userId;


/**
 * Gets the checkins.
 *
 * @param POIID the poiid
 * @param accessTokenPregenerated the access token pregenerated
 * @return the list
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+(NSMutableArray *) GetPOI:(TOS_AccessTokenOAuth *) accessTokenPregenerated andPoiid:(int *) poiId;

@end
