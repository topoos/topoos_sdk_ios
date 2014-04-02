//
//  TOS_TOS_UsersOps.m
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

#import "TOS_UsersOps.h"
#import "TOSAccessOpUsersUSRShow.h"
#import "TOSAccessResUser.h"
#import "TOSAccessCaller.h"
#import "TOSAccessOpUsersNear.h"
#import "TOSAccessResUsersNear.h"
#import "TOS_UsersNear.h"

@implementation TOS_UsersOps


NSString* methoduser = @"GET";
NSString* formatuser = @"json";
int versionuser = 1;

/**
 *
 * @param TOS_UserID
 * @param accessTokenPregenerated
 * @return
 * @throws IOException
 * @throws TopoosException
 */
+ (TOS_User *) Get: (TOS_AccessTokenOAuth *) accessTokenPregenerated  andUserID:(NSString *) UserID
{
    TOS_User * user = nil;
    
    if ([accessTokenPregenerated isValid]) {
        TOSAccessOpUsersUSRShow * UserUSRShow = [[TOSAccessOpUsersUSRShow alloc] initWithOperationName:@"UserShow" andMethod:methoduser andFormat:formatuser andVersion:&versionuser andOauth_token:[accessTokenPregenerated getAccessToken] andUSR:UserID];
        TOSAccessResUser *UserResult = [[TOSAccessResUser alloc]init];
        
        [TOSAccessCaller ExecuteOperation:UserUSRShow withResult:UserResult];
        user= [UserResult getUser];
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return user;
}

/**
 *
 * @param TOS_UserID
 * @param groupID
 * @param accessTokenPregenerated
 * @return
 * @throws IOException
 * @throws TopoosException
 */
/*+ boolean GroupSet(String TOS_UserID, Integer groupID,
                               AccessTokenOAuth accessTokenPregenerated) throws IOException,
TopoosException {
    boolean groupSet = false;
    if (accessTokenPregenerated.isValid()) {
        TOS_UsersUSRAdd_group TOS_UsersUSRAdd_group = new TOS_UsersUSRAdd_group(
                                                                    "GroupSet", method, format, version,
                                                                    accessTokenPregenerated.getAccessToken(), TOS_UserID, groupID);
        GenericResult genericResult = new GenericResult();
        APICaller.ExecuteOperation(TOS_UsersUSRAdd_group, genericResult);
        groupSet = genericResult.getCode() != null
        && genericResult.getCode().equals(200);
    } else {
        throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    return groupSet;
}*/

/**
 *
 * @param TOS_UserID
 * @param groupID
 * @param accessTokenPregenerated
 * @return
 * @throws IOException
 * @throws TopoosException
 */
/*+ boolean GroupRemove(String TOS_UserID, Integer groupID,
                                  AccessTokenOAuth accessTokenPregenerated) throws IOException,
TopoosException {
    boolean groupRemove = false;
    if (accessTokenPregenerated.isValid()) {
        TOS_UsersUSRRemove_group TOS_UsersUSRRemove_group = new TOS_UsersUSRRemove_group(
                                                                             "GroupRemove", method, format, version,
                                                                             accessTokenPregenerated.getAccessToken(), TOS_UserID, groupID);
        GenericResult genericResult = new GenericResult();
        APICaller.ExecuteOperation(TOS_UsersUSRRemove_group, genericResult);
        groupRemove = genericResult.getCode() != null
        && genericResult.getCode().equals(200);
    } else {
        throw new TopoosException(TopoosException.NOT_VALID_TOKEN);
    }
    return groupRemove;
    
}*/

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
andRadius:(int*) radius andGroupID: (int*) groupID andUsersCount:(int *) usersCount andActiveTrack: (bool*) activeTrack {
    NSMutableArray * list = nil;
    if ([accessTokenPregenerated isValid]) {
        TOSAccessOpUsersNear * UsersGet_near = [[TOSAccessOpUsersNear alloc] initWithOperationName:@"NearPOIGet" andMethod:methoduser andFormat:formatuser andVersion:&versionuser andOauth_token:[accessTokenPregenerated getAccessToken] andLatitude:nil andLongitude:nil andPOI:POIID andRadius:radius andIsActive:activeTrack andUgroup:groupID andCount:usersCount];
                                                
                                                
        TOSAccessResUsersNear * UsersNearResult = [[TOSAccessResUsersNear alloc] init];
        [TOSAccessCaller ExecuteOperation:UsersGet_near withResult:UsersNearResult];
        list=[[UsersNearResult getUsersnear] getUserPosition];
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return list;
}

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
                      andRadius:(int*) radius andGroupID: (int*) groupID andUsersCount:(int *) usersCount andActiveTrack: (bool*) activeTrack {
    NSMutableArray * list = nil;
    if ([accessTokenPregenerated isValid]) {
        TOSAccessOpUsersNear * UsersGet_near = [[TOSAccessOpUsersNear alloc] initWithOperationName:@"NearPositionGet" andMethod:methoduser andFormat:formatuser andVersion:&versionuser andOauth_token:[accessTokenPregenerated getAccessToken] andLatitude:Lat andLongitude:Lng andPOI:nil andRadius:radius andIsActive:activeTrack andUgroup:groupID andCount:usersCount];
        
        
        TOSAccessResUsersNear * UsersNearResult = [[TOSAccessResUsersNear alloc] init];
        [TOSAccessCaller ExecuteOperation:UsersGet_near withResult:UsersNearResult];
        list=[[UsersNearResult getUsersnear] getUserPosition];
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return list;
}

/**
 *
 * @param context
 * @param TOS_UserID
 * @return
 * @throws IOException
 * @throws TopoosException
 */
/*+ (TOS_User*) Get(Context context, String TOS_UserID) throws IOException,
TopoosException {
    return Get(TOS_UserID, AccessTokenOAuth.GetAccessToken(context));
}*/

/**
 *
 * @param context
 * @param TOS_UserID
 * @param groupID
 * @return
 * @throws IOException
 * @throws TopoosException
 */
/*+ boolean GroupSet(Context context, String TOS_UserID,
                               Integer groupID) throws IOException, TopoosException {
    return GroupSet(TOS_UserID, groupID, AccessTokenOAuth.GetAccessToken(context));
}*/

/**
 *
 * @param context
 * @param TOS_UserID
 * @param groupID
 * @return
 * @throws IOException
 * @throws TopoosException
 */
/*+ boolean GroupRemove(Context context, String TOS_UserID,
                                  Integer groupID) throws IOException, TopoosException {
    return GroupRemove(TOS_UserID, groupID, AccessTokenOAuth.GetAccessToken(context));
}*/

/**
 * 
 * @param context
 * @param POIID
 * @param radius
 * @param groupID
 * @param TOS_UsersCount
 * @param activeTrack
 * @return
 * @throws IOException
 * @throws TopoosException
 */
/*+ List<TOS_UserIdPosition> NearPOIGet(Context context,
                                              Integer POIID, Integer radius, Integer groupID, Integer TOS_UsersCount,
                                              Boolean activeTrack) throws IOException, TopoosException {
    return NearPOIGet(POIID, radius, groupID, TOS_UsersCount, activeTrack,
                      AccessTokenOAuth.GetAccessToken(context));
}*/

/**
 * 
 * @param context
 * @param lat
 * @param lng
 * @param radius
 * @param groupID
 * @param numberTOS_Users
 * @param activeTrack
 * @return
 * @throws IOException
 * @throws TopoosException
 */
/*+ List<TOS_UserIdPosition> NearPositionGet(Context context,
                                                   Double lat, Double lng, Integer radius, Integer groupID,
                                                   Integer TOS_UsersCount, Boolean activeTrack) throws IOException,
TopoosException {
    return NearPositionGet(lat, lng, radius, groupID, TOS_UsersCount,
                           activeTrack, AccessTokenOAuth.GetAccessToken(context));
}*/
@end
