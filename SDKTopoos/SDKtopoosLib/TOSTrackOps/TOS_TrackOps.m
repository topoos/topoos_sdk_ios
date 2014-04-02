//
//  TOS_TrackOps.m
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

#import "TOS_TrackOps.h"
#import "TOSAccessCaller.h"
#import "TOSAccessOpTrackAdd.h"
#import "TOSAccessOpTrackGet.h"
#import "TOSAccessOpTrackGetLast.h"
#import "TOSAccessResTrack.h"


@implementation TOS_TrackOps


NSString* methodTrack = @"GET";
NSString* formatTrack = @"json";
int versionTrack = 1;

NSString * const LAYER_DEFAULT_ = @"default";
NSString * const LAYER_BEARING_ = @"bearing";
NSString * const LAYER_TRACKLINE_ = @"trackline";

/**
 * Adds the.
 *
 * @param name the name
 * @param accessTokenPregenerated the access token pregenerated
 * @return the track
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_Track *) Add: (TOS_AccessTokenOAuth *) accessTokenPregenerated andName:(NSString *) name {
    
    TOS_Track* track = nil;
    if ([accessTokenPregenerated isValid]) {
        
        TOSAccessOpTrackAdd * tracksAdd = [[TOSAccessOpTrackAdd alloc]initWithOperationName:@"TrackAdd" andMethod:methodTrack andFormat:formatTrack andVersion:&versionTrack andOauth_token:[accessTokenPregenerated getAccessToken]  andDevice:nil andDeviceName:name];
        TOSAccessResTrack * trackResult = [[TOSAccessResTrack alloc] init];
        
        [TOSAccessCaller ExecuteOperation:tracksAdd withResult:trackResult];
        track = [trackResult getTrack];
        
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return track;
    
}

/**
 * Gets the.
 *
 * @param trackID the track id
 * @param numberPositions the number positions
 * @param layers the layers
 * @param accessTokenPregenerated the access token pregenerated
 * @return the track
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_Track *) Get: (TOS_AccessTokenOAuth *) accessTokenPregenerated  andTrackId:(int *) trackid andNumberPositions:(int *) numberPositions andLayers:(NSMutableArray *) layers{
    
    TOS_Track* track = nil;
    if ([accessTokenPregenerated isValid]) {
        
        TOSAccessOpTrackGet * tracksGet = [[TOSAccessOpTrackGet alloc] initWithOperationName:@"TrackGet" andMethod:methodTrack andFormat:formatTrack andVersion:&versionTrack andOauth_token:[accessTokenPregenerated getAccessToken] andTrack:trackid andTotal:numberPositions andInitdate:nil andEnddate:nil andLayers:layers];
        TOSAccessResTrack * trackResult = [[TOSAccessResTrack alloc] init];
        
        [TOSAccessCaller ExecuteOperation:tracksGet withResult:trackResult];
        track = [trackResult getTrack];
        
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return track;
    
}


/**
 * Gets the last.
 *
 * @param numberPOIS the number pois
 * @param layers the layers
 * @param accessTokenPregenerated the access token pregenerated
 * @return the track
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_Track *) GetLast: (TOS_AccessTokenOAuth *) accessTokenPregenerated andNumberPositions:(int *) numberPositions andLayers:(NSMutableArray *) layers{
    
    TOS_Track* track = nil;
    if ([accessTokenPregenerated isValid]) {
        
        TOSAccessOpTrackGetLast * tracksGet = [[TOSAccessOpTrackGetLast alloc] initWithOperationName:@"TrackGetLast" andMethod:methodTrack andFormat:formatTrack andVersion:&versionTrack andOauth_token:[accessTokenPregenerated getAccessToken] andDevice:nil andTotal:numberPositions andLayers:layers];
        TOSAccessResTrack * trackResult = [[TOSAccessResTrack alloc] init];
        
        [TOSAccessCaller ExecuteOperation:tracksGet withResult:trackResult];
        track = [trackResult getTrack];
        
    } else {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"In %@: Token Not Valid", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    }
    return track;
    
}



@end
