//
//  TOS_Position.m
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

#import "TOS_Position.h"

@implementation TOS_Position

@synthesize Identifier, Device, Timestamp, RegisterTime, Latitude, Longitude, Elevation, PositionType, Accuracy, Vaccuracy, Bearing, Velocity, TrackId;

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
-(TOS_Position*) init{
    self=[super init];
    return self;
}

-(TOS_Position*) initWithId: (int ) identifier andDevice: (NSString *) device andTimestamp: (NSDate*) timestamp andRegisterTime: (NSDate*) registerTime
                andLatitude: (float ) latitude andLongitude: (float ) longitude andElevation: (float ) elevation
            andPositionType: (TOS_PositionType *) positionType andAccuracy: (float ) accuracy andVaccuracy: (float ) vaccuracy
                 andBearing: (float ) bearing andVelocity: (float ) velocity andTrackId: (NSString *) trackId{
    self=[super init];
    return self;
}


/**
 * get the id.
 * @return the id
 */
- (int ) getIdentifier{
    return Identifier;
}

/**
 * Sets the id.
 * @param identifier the id to set
 */
- (void) setIdentifier:(int )identifier{
    Identifier = identifier;
}

/**
 * get the device.
 * @return the device
 */
- (NSString *) getDevice{
    return Device;
}

/**
 * Sets the device.
 * @param device the device to set
 */
- (void) setDevice:(NSString *) device{
    Device = device;
}

/**
 * get the time stamp.
 * @return the timestamp
 */
- (NSDate *) getTimestamp{
    return Timestamp;
};

/**
 * Sets the timestamp.
 * @param timestamp the timestamp to set
 */
- (void) setTimestamp:(NSDate *) timestamp{
    Timestamp = timestamp;
}

/**
 * get the register time.
 * @return the registerTime
 */
- (NSDate *) getRegisterTime{
    return RegisterTime;
}

/**
 * Sets the register time.
 * @param registerTime the registerTime to set
 */
- (void) setRegisterTime:(NSDate *) registerTime{
    RegisterTime = registerTime;
}

/**
 * get the latitude.
 * @return the latitude
 */
- (float ) getLatitude{
    return Latitude;
}

/**
 * Sets the latitude.
 * @param latitude the latitude to set
 */
- (void) setLatitude:(float ) latitude{
    Latitude = latitude;
}

/**
 * get the longitude.
 * @return the longitude
 */
- (float ) getLongitude{
    return Longitude;
}

/**
 * Sets the longitude.
 * @param longitude the longitude to set
 */
- (void) setLongitude:(float ) longitude{
    Longitude = longitude;
}

/**
 * get the elevation.
 * @return the elevation
 */
- (float ) getElevation{
    return Elevation;
}

/**
 * Sets the elevation.
 * @param elevation the elevation to set
 */
- (void) setElevation:(float ) elevation{
    Elevation = elevation;
}

/**
 * get the position type.
 * @return the positionType
 */
- (TOS_PositionType *) getPositionType{
    return PositionType;
}

/**
 * Sets the position type.
 * @param positionType the positionType to set
 */
- (void) setPositionType:(TOS_PositionType *) positionType{
    PositionType = positionType;
}

/**
 * get the accuracy.
 * @return the accuracy
 */
- (float ) getAccuracy{
    return Accuracy;
}

/**
 * Sets the accuracy.
 * @param accuracy the accuracy to set
 */
- (void) setAccuracy:(float ) accuracy{
    Accuracy = accuracy;
}

/**
 * get the vaccuracy.
 * @return the vaccuracy
 */
- (float ) getVaccuracy{
    return Vaccuracy;
}

/**
 * Sets the vaccuracy.
 * @param vaccuracy the vaccuracy to set
 */
- (void) setVaccuracy:(float ) vaccuracy{
    Vaccuracy = vaccuracy;
}

/**
 * get the bearing.
 * @return the bearing
 */
- (float ) getBearing{
    return Bearing;
}

/**
 * Sets the bearing.
 * @param bearing the bearing to set
 */
- (void) setBearing:(float ) bearing{
    Bearing = bearing;
}

/**
 * get the velocity.
 * @return the velocity
 */
- (float ) getVelocity{
    return Velocity;
}

/**
 * Sets the velocity.
 * @param velocity the velocity to set
 */
- (void) setVelocity:(float ) velocity{
    Velocity = velocity;
}

/**
 * get the track id.
 *
 * @return the trackid
 */
- (NSString *) getTrackId{
    return TrackId;
}

/**
 * Sets the track_id.
 * @param trackid the trackid to set
 */
- (void) setTrackId:(NSString *) trackId{
    TrackId = trackId;
}


@end
