//
//  TOS_POIDataWarning.m
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
#import "TOS_POIDataWarning.h"

@implementation TOS_POIDataWarning

@synthesize Poi, PoiWarnings;

/**
 * Instantiates a new pOI data warning.
 *
 * @param poi the poi
 * @param poiWarnings the poi warnings
 */
-(TOS_POIDataWarning*) init
{
    self=[super init];
    return self;
}

-(TOS_POIDataWarning*) initWithPoi: (TOS_POI *) poi andPoiWarnings:(NSMutableArray *) poiwarnings
{
    self=[super init];
    if(self){
        Poi = poi;
        PoiWarnings = poiwarnings;
    }
    return self;
}

/**
 * get the poi.
 * @return the poi
 */
- (TOS_POI *) getPoi
{
    return Poi;
}

/**
 * Sets the poi.
 * @param poi the poi to set
 */
- (void) setPoi:(TOS_POI *) poi
{
    Poi = poi;
}

/**
 * get the poi warnings.
 * @return the poiWarnings
 */
- (NSMutableArray *) getPoiWarnings
{
    return PoiWarnings;
}


/**
 * Sets the poi warnings.
 * @param poiWarnings the poiWarnings to set
 */
- (void) setPoiWarnings:(NSMutableArray *) poiwarnings
{
    PoiWarnings = poiwarnings;
}


@end
