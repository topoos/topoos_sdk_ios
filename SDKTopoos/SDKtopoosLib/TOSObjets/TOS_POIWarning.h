//
//  TOS_POIWarning.h
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
#import "TOS_POIWarningData.h"

@interface TOS_POIWarning : NSObject

/**
 * V0
 */

//#define serialVersionUID 1 --> ya está definida

/** The id. */
@property (nonatomic,readwrite) int  Identifier ;

/** The poi_id. */
@property (nonatomic,readwrite) int  PoiId ;

/** The type. */
@property (nonatomic,retain) NSString * Type ;

/** The user_id. */
@property (nonatomic,retain) NSString * UserId ;

/** The timestamp. */
@property (nonatomic,retain) NSDate * Timestamp ;

/** The data. */
@property (nonatomic,retain) TOS_POIWarningData * Data ;

/**
 * Instantiates a new pOI warning.
 *
 * @param id the id
 * @param poi_id the poi_id
 * @param type the type
 * @param user_id the user_id
 * @param timestamp the timestamp
 * @param data the data
 */
-(TOS_POIWarning*) init;

-(TOS_POIWarning*) initWithId: (int ) identifier andPoiId: (int ) poiId andType: (NSString *) type andUserId: (NSString *) userid
                 andTimestamp: (NSDate *) timestamp andData: (TOS_POIWarningData *) data;


/**
 * get the id of the warning.
 *
 * @return the id
 */
- (int ) getIdentifier;

/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setIdentifier:(int ) identifier;

/**
 * get the id of the poi.
 *
 * @return the poi_id
 */
- (int ) getPoiId;

/**
 * Sets the poi_id.
 *
 * @param poi_id the poi_id to set
 */
- (void) setPoiId:(int ) poiid;

/**
 * get the type.
 *
 * @return the type
 */
- (NSString *) getType;

/**
 * Sets the type.
 *
 * @param type the type to set
 */
- (void) setType:(NSString *) type;

/**
 * get the id of the user.
 *
 * @return the user_id
 */
- (NSString *) getUserId;

/**
 * Sets the user_id.
 *
 * @param user_id the user_id to set
 */
- (void) setUserId:(NSString *) userId;

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
 * get the data of the warning.
 *
 * @return the data
 */
- (TOS_POIWarningData *) getData;

/**
 * Sets the data.
 *
 * @param data the data to set
 */
- (void) setData:(TOS_POIWarningData *) data;

@end
