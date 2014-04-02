//
//  TOS_GeoData.m
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

#import "TOS_GeoData.h"

@implementation TOS_GeoData

@synthesize Poi_id,Identifier,Position_id;

/**
 * Instantiates a new geo data.
 *
 * @param id the id
 * @param position_id the position_id
 * @param poi_id the poi_id
 */
-(TOS_GeoData*) init
{
    self=[super init];
    return self;
}

-(TOS_GeoData*) initWithIdentifier: (int *) identifier andPosition_id:(int *) position_id andPoi_id:(int *) poi_id{
    self=[super init];
    if (self){
        Identifier=identifier;
        Position_id=position_id;
        Poi_id=poi_id;
    }
    return self;
}

/**
 * Gets the id.
 *
 * @return the id
 */
-(int *) getIdentifier {
    return Identifier;
}

/**
 * Sets the id.
 *
 * @param id the id to set
 */
-(void) setIdentifier:(int *) identifier{
    Identifier=identifier;
}


/**
 * Gets the position_id.
 *
 * @return the position_id
 */
-(int *) getPosition_id {
    return Position_id;
}

/**
 * Sets the position_id.
 *
 * @param position_id the position_id to set
 */
-(void)setPosition_id:(int *) position_id {
    Position_id = position_id;
}

/**
 * Gets the poi_id.
 *
 * @return the poi_id
 */
-(int *) getPoi_id {
    return Poi_id;
}

/**
 * Sets the poi_id.
 *
 * @param poi_id the poi_id to set
 */
-(void) setPoi_id:(int *) poi_id {
    Poi_id = poi_id;
}



@end
