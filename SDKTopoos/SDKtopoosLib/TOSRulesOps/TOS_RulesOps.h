//
//  TOS_RulesOps.h
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

@interface TOS_RulesOps : NSObject

/**
 * Adds the track out of bounds.
 *
 * @param accessTokenPregenerated the access token pregenerated
 * @param track the track
 * @param lat the lat
 * @param lng the lng
 * @param radius the radius
 * @return the rule
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_Rule *) AddTrackOutOfBounds: (TOS_AccessTokenOAuth *) accessTokenPregenerated
                        andTrackId: (int *) trackID andLatitude: (float *) lat andLongitude: (float *) lng andRadius: (int *) radius;

/**
 * Adds the track out of bounds.
 *
 * @param context the context
 * @param track the track
 * @param lat the lat
 * @param lng the lng
 * @param radius the radius
 * @return the rule
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws TopoosException the topoos exception
 */
+ (TOS_Rule *) AddTrackOutOfBounds: (int *) trackID andLatitude: (float *) lat andLongitude: (float *) lng andRadius: (int *) radius;

@end
