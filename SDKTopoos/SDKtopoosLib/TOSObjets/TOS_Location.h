//
//  TOS_Location.h
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

@interface TOS_Location : NSObject

/** The latitude. */
@property (nonatomic,retain) NSNumber * Latitude;

/** The longitude. */
@property (nonatomic,retain) NSNumber * Longitude;

/**
 * Instantiates a new location.
 *
 * @param latitude the latitude
 * @param longitude the longitude
 */
-(TOS_Location*) init;

-(TOS_Location*) initWithLatitude: (NSNumber *) latitude andLongitude:(NSNumber *) longitude;

/**
 * get the latitude.
 *
 * @return the latitude
 */
- (NSNumber *) getLatitude ;

/**
 * Sets the latitude.
 *
 * @param latitude the latitude to set
 */
- (void) setLatitude:(NSNumber *) latitude ;

/**
 * get the longitude.
 *
 * @return the longitude
 */
- (NSNumber *) getLongitude ;
/**
 * Sets the longitude.
 *
 * @param longitude the longitude to set
 */
- (void) setLongitude:(NSNumber *) longitude ;


@end
