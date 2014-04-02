//
//  TOS_UserPosition.h
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

@interface TOS_UserPosition : NSObject

/** The latitude. */
@property (nonatomic,readwrite) float  Latitude;

/** The longitude. */
@property (nonatomic,readwrite) float  Longitude;

/** The accuracy. */
@property (nonatomic,readwrite) float  Accuracy;


/**
 * Instantiates a new user position.
 *
 * @param latitude the latitude
 * @param longitude the longitude
 * @param accuracy the accuracy
 */
-(TOS_UserPosition*) init;

-(TOS_UserPosition*) initWithAccuracy: (float ) accuracy andLatitude: (float ) latitude andLongitude:(float ) longitude ;

/**
 * get the latitude.
 *
 * @return the latitude
 */
- (float ) getLatitude ;
/**
 * Sets the latitude.
 *
 * @param latitude the latitude to set
 */
- (void) setLatitude:(float ) latitude ;

/**
 * get the longitude.
 *
 * @return the longitude
 */
- (float ) getLongitude ;

/**
 * Sets the longitude.
 *
 * @param longitude the longitude to set
 */
- (void) setLongitude:(float ) longitude ;

/**
 * get the accuracy.
 *
 * @return the accuracy
 */
- (float ) getAccuracy ;

/**
 * Sets the accuracy.
 *
 * @param accuracy the accuracy to set
 */
- (void) setAccuracy:(float ) accuracy ;





@end
