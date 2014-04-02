//
//  TOS_TrackOps.h
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
#import "TOS_Track.h"
#import "TOS_AccessTokenOAuth.h"

@interface TOS_TrackOps : NSObject
/** The Constant LAYER_DEFAULT. */
extern NSString * const LAYER_DEFAULT_;

/** The Constant LAYER_BEARING. */
extern NSString * const  LAYER_BEARING_;

/** The Constant LAYER_TRACKLINE. */
extern NSString * const  LAYER_TRACKLINE_;

/**
 * Adds the.
 *
 * @param name the name
 * @param accessTokenPregenerated the access token pregenerated
 * @return the track
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_Track *) Add: (TOS_AccessTokenOAuth *) accessTokenPregenerated andName:(NSString *) name ;

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
+ (TOS_Track *) Get: (TOS_AccessTokenOAuth *) accessTokenPregenerated  andTrackId:(int *) trackid andNumberPositions:(int *) numberPositions andLayers:(NSMutableArray *) layers;


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
+ (TOS_Track *) GetLast: (TOS_AccessTokenOAuth *) accessTokenPregenerated   andNumberPositions:(int *) numberPositions andLayers:(NSMutableArray *) layers;


@end
