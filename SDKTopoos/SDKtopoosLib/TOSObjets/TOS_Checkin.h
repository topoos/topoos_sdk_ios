//
//  TOS_Checkin.h
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

@interface TOS_Checkin : NSObject


/** The id. */
@property (nonatomic,readwrite) int Identifier;

/** The device_id. */
@property (nonatomic,readwrite) int Device_id;

/** The user_id. */
@property (nonatomic,retain) NSString * User_id;

/** The poi_id. */
@property (nonatomic,readwrite) int Poi_id;

/** The register_time. */
@property (nonatomic,retain) NSDate * Register_time;

/** The timestamp. */
@property (nonatomic,retain) NSDate * Timestamp;


/**
 * Instantiates a new checkin.
 *
 * @param id the id
 * @param device_id the device_id
 * @param poi_id the poi_id
 * @param register_time the register_time
 * @param timestamp the timestamp
 */
-(TOS_Checkin*) init;

-(TOS_Checkin*) initWithID: (int ) identifier andUserID:(NSString *) user_id andDeviceID:(int ) device_id andPoi_id:(int ) poi_id andRegisterTime:(NSDate* ) register_time andTimestamp:(NSDate *) timestamp;

/**
 * get the id.
 *
 * @return the id
 */
-(int ) getIdentifier ;

/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setIdentifier:(int ) identifier ;

/**
 * get the user id.
 *
 * @return the user_id
 */
- (NSString * ) getUser_id;

/**
 * Sets the user_id.
 *
 * @param user_id the user_id to set
 */
- (void) setUser_id:(NSString * ) user_id;

/**
 * get the device id.
 *
 * @return the device_id
 */
- (int ) getDevice_id ;

/**
 * Sets the device_id.
 *
 * @param device_id the device_id to set
 */
- (void) setDevice_id:(int ) device_id ;

/**
 * get the id of the poi.
 *
 * @return the poi_id
 */
- (int ) getPoi_id ;

/**
 * Sets the poi_id.
 *
 * @param poi_id the poi_id to set
 */
- (void) setPoi_id:(int ) poi_id ;

/**
 * get the register time.
 *
 * @return the register_time
 */
- (NSDate *) getRegister_time ;

/**
 * Sets the register_time.
 *
 * @param register_time the register_time to set
 */
- (void) setRegister_time:(NSDate *) register_time ;

/**
 * get the timestamp.
 *
 * @return the timestamp
 */
- (NSDate *) getTimestamp ;

/**
 * Sets the timestamp.
 *
 * @param timestamp the timestamp to set
 */
- (void) setTimestamp:(NSDate*) timestamp;

@end
