//
//  TOS_Position.h
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
#import "TOS_PositionType.h"

@interface TOS_Position : NSObject

/**
 * V0
 */

/** The id. */
@property (nonatomic,readwrite) int Identifier ; //id

/** The device. */
@property (nonatomic,retain) NSString * Device ;

/** The timestamp. */
@property (nonatomic,retain) NSDate * Timestamp ;

/** The registertime. */
@property (nonatomic,retain) NSDate * RegisterTime ;

/** The latitude. */
@property (nonatomic,readwrite) float  Latitude ;

/** The longitude. */
@property (nonatomic,readwrite) float  Longitude ;

/** The elevation. */
@property (nonatomic,readwrite) float  Elevation ;

/** The position type. */
@property (nonatomic, retain) TOS_PositionType * PositionType ;

/** The accuracy. */
@property (nonatomic,readwrite) float  Accuracy ;

/** The vaccuracy. */
@property (nonatomic,readwrite) float  Vaccuracy ;

/** The bearing. */
@property (nonatomic,readwrite) float  Bearing ;

/** The velocity. */
@property (nonatomic,readwrite) float Velocity ;

/** The track id. */
@property (nonatomic,retain) NSString * TrackId ;

/**
 * Instantiates a new position.
 *
 * @param identifier the id
 * @param device the device
 * @param timestamp the timestamp
 * @param registerTime the register time
 * @param latitude the latitude
 * @param longitude the longitude
 * @param elevation the elevation
 * @param positionType the position type
 * @param accuracy the accuracy
 * @param vaccuracy the vaccuracy
 * @param bearing the bearing
 * @param velocity the velocity
 * @param track_id the track_id
 */
-(TOS_Position*) init;

-(TOS_Position*) initWithId: (int ) identifier andDevice: (NSString *) device andTimestamp: (NSDate*) timestamp andRegisterTime: (NSDate*) registerTime
                andLatitude: (float ) latitude andLongitude: (float ) longitude andElevation: (float ) elevation
            andPositionType: (TOS_PositionType *) positionType andAccuracy: (float ) accuracy andVaccuracy: (float ) vaccuracy
                 andBearing: (float ) bearing andVelocity: (float ) velocity andTrackId: (NSString *) trackId;


/**
 * get the id.
 *
 * @return the id
 */
- (int ) getIdentifier;

/**
 * Sets the id.
 *
 * @param identifier the id to set
 */
- (void) setIdentifier:(int ) identifier;

/**
 * get the device.
 *
 * @return the device
 */
- (NSString *) getDevice;

/**
 * Sets the device.
 *
 * @param device the device to set
 */
- (void) setDevice:(NSString *) device;

/**
 * get the time stamp.
 *
 * @return the timestamp
 */
- (NSDate *) getTimestamp;

/**
 * Sets the timestamp.
 *
 * @param timestamp the timestamp to set
 */
- (void) setTimestamp:(NSDate *) timestamp;

/**
 * get the register time.
 *
 * @return the registerTime
 */
- (NSDate *) getRegisterTime;

/**
 * Sets the register time.
 *
 * @param registerTime the registerTime to set
 */
- (void) setRegisterTime:(NSDate *)registerTime;

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
- (void) setLongitude:(float ) longitude;

/**
 * get the elevation.
 *
 * @return the elevation
 */
- (float ) getElevation ;

/**
 * Sets the elevation.
 *
 * @param elevation the elevation to set
 */
- (void) setElevation:(float ) elevation ;

/**
 * get the position type.
 *
 * @return the positionType
 */
- (TOS_PositionType *) getPositionType;

/**
 * Sets the position type.
 *
 * @param positionType the positionType to set
 */
- (void) setPositionType:(TOS_PositionType *) positionType;

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

/**
 * get the vaccuracy.
 *
 * @return the vaccuracy
 */
- (float ) getVaccuracy;

/**
 * Sets the vaccuracy.
 *
 * @param vaccuracy the vaccuracy to set
 */
- (void) setVaccuracy:(float ) vaccuracy ;

/**
 * get the bearing.
 *
 * @return the bearing
 */
- (float ) getBearing;

/**
 * Sets the bearing.
 *
 * @param bearing the bearing to set
 */
- (void) setBearing:(float ) bearing ;

/**
 * get the velocity.
 *
 * @return the velocity
 */
- (float ) getVelocity;

/**
 * Sets the velocity.
 *
 * @param velocity the velocity to set
 */
- (void) setVelocity:(float ) velocity ;

/**
 * get the track id.
 *
 * @return the trackid
 */
- (NSString *) getTrackId;

/**
 * Sets the track_id.
 *
 * @param trackid the trackid to set
 */
- (void) setTrackId:(NSString *) trackId;


@end
