//
//  TOS_POIWarning.m
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
#import "TOS_POIWarning.h"

@implementation TOS_POIWarning

@synthesize Identifier, PoiId, Type, UserId, Timestamp, Data;

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
-(TOS_POIWarning*) init{
    self=[super init];
    return self;
}

-(TOS_POIWarning*) initWithId: (int ) identifier andPoiId: (int ) poiId andType: (NSString *) type andUserId: (NSString *) userid
                 andTimestamp: (NSDate *) timestamp andData: (TOS_POIWarningData *) data{
    self=[super init];
    if(self){
        Identifier=identifier;
        PoiId = poiId;
        Type = type;
        UserId = userid;
        Timestamp = timestamp;
        Data = data;
    }
    return self;
}

/**
 * get the id of the warning.
 *
 * @return the id
 */
- (int ) getIdentifier
{
    return Identifier;
}

/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setIdentifier:(int ) identifier
{
    Identifier = identifier;
}

/**
 * get the id of the poi.
 *
 * @return the poi_id
 */
- (int ) getPoiId
{
    return PoiId;
}

/**
 * Sets the poi_id.
 *
 * @param poi_id the poi_id to set
 */
- (void) setPoiId:(int ) poiid
{
    PoiId = poiid;
}

/**
 * get the type.
 *
 * @return the type
 */
- (NSString *) getType
{
    return Type;
}

/**
 * Sets the type.
 *
 * @param type the type to set
 */
- (void) setType:(NSString *) type
{
    Type = type;
}

/**
 * get the id of the user.
 *
 * @return the user_id
 */
- (NSString *) getUserId
{
    return UserId;
}

/**
 * Sets the user_id.
 *
 * @param user_id the user_id to set
 */
- (void) setUserId:(NSString *) userId
{
    UserId = userId;
}

/**
 * get the time stamp.
 *
 * @return the timestamp
 */
- (NSDate *) getTimestamp
{
    return Timestamp;
}

/**
 * Sets the timestamp.
 *
 * @param timestamp the timestamp to set
 */
- (void) setTimestamp:(NSDate *) timestamp
{
    Timestamp = timestamp;
}

/**
 * get the data of the warning.
 *
 * @return the data
 */
- (TOS_POIWarningData *) getData
{
    return Data;
}

/**
 * Sets the data.
 *
 * @param data the data to set
 */
- (void) setData:(TOS_POIWarningData *) data
{
    Data = data;
}

@end
