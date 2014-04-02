//
//  TOS_Track.h
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

@interface TOS_Track : NSObject
/** The id. */
@property (nonatomic,readwrite) int Identifier ; //id

/** The name. */
@property (nonatomic,retain) NSString * Name;

/** The device. */
@property (nonatomic,readwrite) int Device;

/** The positions. TOS_Position array */
@property (nonatomic,retain) NSMutableArray * Positions;

/**
 * Instantiates a new track.
 *
 * @param id the id
 * @param name the name
 * @param device the device
 * @param positions the positions
 */

-(TOS_Track*) init;

-(TOS_Track*) initWithIdentifier: (int ) identifier andName:(NSString*) name andDevice:(int) device andPositions:(NSMutableArray *) positions ;


/**
 * get the id.
 *
 * @return the id
 */
- (int ) getIdentifier ;
/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setIdentifier:(int ) identifier ;

/**
 * get the name.
 *
 * @return the name
 */
- (NSString *) getName;

/**
 * Sets the name.
 *
 * @param name the name to set
 */
- (void) setName:(NSString *) name ;

/**
 * get the device.
 *
 * @return the device
 */
- (int ) getDevice;

/**
 * Sets the device.
 *
 * @param device the device to set
 */
- (void) setDevice:(int ) device ;
/**
 * get the positions.
 *
 * @return the positions
 */
- (NSMutableArray *) getPositions ;
/**
 * Sets the positions.
 *
 * @param positions the positions to set
 */
- (void) setPositions:(NSMutableArray *) positions;

@end
