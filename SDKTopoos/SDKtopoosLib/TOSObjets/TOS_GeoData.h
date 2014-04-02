//
//  TOS_GeoData.h
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

#import "TOS_GeoData.h"
@interface TOS_GeoData : NSObject

/** The id. */
@property (nonatomic,readwrite) int * Identifier;

/** The position_id. */
@property (nonatomic,readwrite) int *  Position_id;

/** The poi_id. */
@property (nonatomic,readwrite) int * Poi_id;

/**
 * Instantiates a new geo data.
 *
 * @param id the id
 * @param position_id the position_id
 * @param poi_id the poi_id
 */
-(TOS_GeoData*) init;

-(TOS_GeoData*) initWithIdentifier: (int *) identifier andPosition_id:(int *) position_id andPoi_id:(int *) poi_id;

/**
 * Gets the id.
 *
 * @return the id
 */
-(int *) getIdentifier ;

/**
 * Sets the id.
 *
 * @param id the id to set
 */
-(void) setIdentifier:(int *) identifier;


/**
 * Gets the position_id.
 *
 * @return the position_id
 */
-(int *) getPosition_id ;

/**
 * Sets the position_id.
 *
 * @param position_id the position_id to set
 */
-(void)setPosition_id:(int *) position_id ;

/**
 * Gets the poi_id.
 *
 * @return the poi_id
 */
-(int *) getPoi_id;

/**
 * Sets the poi_id.
 *
 * @param poi_id the poi_id to set
 */
-(void) setPoi_id:(int *) poi_id;

@end
