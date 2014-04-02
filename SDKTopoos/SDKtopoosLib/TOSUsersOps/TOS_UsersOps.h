//
//  TOS_UsersOps.h
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

#import <Foundation/Foundation.h>
#import "TOS_User.h"
#import "TOS_AccessTokenOAuth.h"
@interface TOS_UsersOps : NSObject
/**
 *
 * @param TOS_UserID
 * @param accessTokenPregenerated
 * @return
 * @throws IOException
 * @throws TopoosException
 */
+ (TOS_User *) Get: (TOS_AccessTokenOAuth *) accessTokenPregenerated  andUserID:(NSString *) UserID;

/**
 *
 * @param POIID
 * @param radius
 * @param groupID
 * @param TOS_UsersCount
 * @param activeTrack
 * @param accessTokenPregenerated
 * @return
 * @throws IOException
 * @throws TopoosException
 */
+ (NSMutableArray *) NearPOIGet: (TOS_AccessTokenOAuth *) accessTokenPregenerated andPOIID: (int *) POIID
                      andRadius:(int*) radius andGroupID: (int*) groupID andUsersCount:(int *) usersCount andActiveTrack: (bool*) activeTrack ;

/**
 *
 * @param lat
 * @param lng
 * @param radius
 * @param groupID
 * @param numberTOS_Users
 * @param activeTrack
 * @param accessTokenPregenerated
 * @return
 * @throws IOException
 * @throws TopoosException
 */
+ (NSMutableArray *) NearPositionGet: (TOS_AccessTokenOAuth *) accessTokenPregenerated andLat: (float *) Lat andLng:(float*) Lng
                           andRadius:(int*) radius andGroupID: (int*) groupID andUsersCount:(int *) usersCount andActiveTrack: (bool*) activeTrack ;


@end
