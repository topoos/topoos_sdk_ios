//
//  TOS_Location.m
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

#import "TOS_Location.h"

@implementation TOS_Location

@synthesize Latitude,Longitude;

/**
 * Instantiates a new location.
 *
 * @param latitude the latitude
 * @param longitude the longitude
 */
-(TOS_Location*) init
{
    self=[super init];
    return self;
}

-(TOS_Location*) initWithLatitude: (NSNumber *) latitude andLongitude:(NSNumber *) longitude{
    self=[super init];
    if (self){
        Latitude=latitude;
        Longitude=longitude;
    }
    return self;
}

/**
 * get the latitude.
 *
 * @return the latitude
 */
- (NSNumber *) getLatitude {
    return Latitude;
}

/**
 * Sets the latitude.
 *
 * @param latitude the latitude to set
 */
- (void) setLatitude:(NSNumber *) latitude {
    Latitude = latitude;
}

/**
 * get the longitude.
 *
 * @return the longitude
 */
- (NSNumber *) getLongitude {
    return Longitude;
}

/**
 * Sets the longitude.
 *
 * @param longitude the longitude to set
 */
- (void) setLongitude:(NSNumber *) longitude {
    Longitude = longitude;
}


@end
