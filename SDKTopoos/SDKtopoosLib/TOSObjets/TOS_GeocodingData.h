//
//  TOS_GeocodingData.h
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
#import "TOS_Location.h"
#import "TOS_ViewportType.h"
#import "TOS_Address.h"

@interface TOS_GeocodingData : NSObject

/** The address. */
@property (nonatomic,retain) TOS_Address * Address;

/** The location. */
@property (nonatomic,retain) TOS_Location * Location;

/** The bounds. */
@property (nonatomic,retain) TOS_ViewportType * Bounds;

/**
 * Instantiates a new geocoding data.
 *
 * @param address the address
 * @param location the location
 * @param bounds the bounds
 */
-(TOS_GeocodingData*) init;

-(TOS_GeocodingData*) initWithAddress: (TOS_Address *) address andLocation: (TOS_Location *) location andBounds:(TOS_ViewportType *) bounds;

/**
 * get the address that it is saved in a geocoding data.
 *
 * @return the address
 */
- (TOS_Address *) getAddress ;

/**
 * Sets the address.
 *
 * @param address the address to set
 */
- (void) setAddress:(TOS_Address *) address;

/**
 * get the location.
 *
 * @return the location
 */
- (TOS_Location*) getLocation ;

/**
 * Sets the location.
 *
 * @param location the location to set
 */
- (void) setLocation:(TOS_Location *)location;
/**
 * get the bounds.
 *
 * @return the bounds
 */
-(TOS_ViewportType *) getBounds;

/**
 * Sets the bounds.
 *
 * @param bounds the bounds to set
 */
- (void) setBounds:(TOS_ViewportType *) bounds;


@end
