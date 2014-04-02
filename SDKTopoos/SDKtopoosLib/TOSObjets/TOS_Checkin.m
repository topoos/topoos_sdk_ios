//
//  TOS_Checkin.m
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

#import "TOS_Checkin.h"

@implementation TOS_Checkin

@synthesize Device_id,Identifier,User_id,Poi_id,Register_time,Timestamp;

/**
 * Instantiates a new checkin.
 *
 * @param id the id
 * @param device_id the device_id
 * @param poi_id the poi_id
 * @param register_time the register_time
 * @param timestamp the timestamp
 */
-(TOS_Checkin*) init
{
    self=[super init];
    return self;
}

-(TOS_Checkin*) initWithID: (int ) identifier andUserID:(NSString *) user_id andDeviceID:(int ) device_id andPoi_id:(int ) poi_id andRegisterTime:(NSDate* ) register_time andTimestamp:(NSDate *) timestamp
{
    self=[super init];
    if (self){
        Identifier=identifier;
        Device_id=device_id;
        Poi_id=poi_id;
        User_id=user_id;
        Register_time=register_time;
        Timestamp=timestamp;
    }
    return self;
}

/**
 * get the id.
 *
 * @return the id
 */
-(int ) getIdentifier {
    return Identifier;
}

/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setIdentifier:(int ) identifier {
    Identifier = identifier;
}

/**
 * get the user id.
 *
 * @return the user_id
 */
- (NSString * ) getUser_id{
    return User_id;
}

/**
 * Sets the user_id.
 *
 * @param user_id the user_id to set
 */
- (void) setUser_id:(NSString * ) user_id {
    User_id = user_id;
}

/**
 * get the device id.
 *
 * @return the device_id
 */
- (int ) getDevice_id {
    return Device_id;
}

/**
 * Sets the device_id.
 *
 * @param device_id the device_id to set
 */
- (void) setDevice_id:(int ) device_id {
    Device_id = device_id;
}

/**
 * get the id of the poi.
 *
 * @return the poi_id
 */
- (int ) getPoi_id {
    return Poi_id;
}

/**
 * Sets the poi_id.
 *
 * @param poi_id the poi_id to set
 */
- (void) setPoi_id:(int ) poi_id {
    Poi_id = poi_id;
}

/**
 * get the register time.
 *
 * @return the register_time
 */
- (NSDate *) getRegister_time {
    return Register_time;
}

/**
 * Sets the register_time.
 *
 * @param register_time the register_time to set
 */
- (void) setRegister_time:(NSDate *) register_time {
    Register_time = register_time;
}

/**
 * get the timestamp.
 *
 * @return the timestamp
 */
- (NSDate *) getTimestamp {
    return Timestamp;
}

/**
 * Sets the timestamp.
 *
 * @param timestamp the timestamp to set
 */
- (void) setTimestamp:(NSDate*) timestamp {
    Timestamp = timestamp;
}






@end
