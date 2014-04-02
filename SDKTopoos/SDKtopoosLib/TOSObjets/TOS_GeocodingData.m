//
//  TOS_GeocodingData.m
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

#import "TOS_GeocodingData.h"

@implementation TOS_GeocodingData

@synthesize Address,Bounds,Location;


/**
 * Instantiates a new geocoding data.
 *
 * @param address the address
 * @param location the location
 * @param bounds the bounds
 */
-(TOS_GeocodingData*) init
{
    self=[super init];
    return self;
}

-(TOS_GeocodingData*) initWithAddress: (TOS_Address *) address andLocation: (TOS_Location *) location andBounds:(TOS_ViewportType *) bounds{
    self=[super init];
    if (self){
        Address=address;
        Location=location;
        Bounds=bounds;
    }
    return self;
}

/**
 * get the address that it is saved in a geocoding data.
 *
 * @return the address
 */
- (TOS_Address *) getAddress {
    return Address;
}

/**
 * Sets the address.
 *
 * @param address the address to set
 */
- (void) setAddress:(TOS_Address *) address{
    Address = address;
}

/**
 * get the location.
 *
 * @return the location
 */
- (TOS_Location*) getLocation {
    return Location;
}

/**
 * Sets the location.
 *
 * @param location the location to set
 */
- (void) setLocation:(TOS_Location *)location{
   Location = location;
}

/**
 * get the bounds.
 *
 * @return the bounds
 */
-(TOS_ViewportType *) getBounds {
    return Bounds;
}

/**
 * Sets the bounds.
 *
 * @param bounds the bounds to set
 */
- (void) setBounds:(TOS_ViewportType *) bounds{
    Bounds = bounds;
}

@end
