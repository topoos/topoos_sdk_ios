//
//  TOS_POIDataWarning.h
//  SDKtopoos
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
#import "TOS_POI.h"

@interface TOS_POIDataWarning : NSObject

/** The poi. */
@property (nonatomic,retain) TOS_POI * Poi ;

/** The poi warnings. */
@property (nonatomic,retain) NSMutableArray * PoiWarnings;

/**
 * Instantiates a new pOI data warning.
 *
 * @param poi the poi
 * @param poiWarnings the poi warnings
 */
-(TOS_POIDataWarning*) init;
-(TOS_POIDataWarning*) initWithPoi: (TOS_POI *) Poi andPoiWarnings:(NSMutableArray *) poiwarnings;


/**
 * get the poi.
 * @return the poi
 */
- (TOS_POI *) getPoi;

/**
 * Sets the poi.
 * @param poi the poi to set
 */
- (void) setPoi:(TOS_POI *) poi;

/**
 * get the poi warnings.
 * @return the poiWarnings
 */
- (NSMutableArray *) getPoiWarnings;

/**
 * Sets the poi warnings.
 * @param poiWarnings the poiWarnings to set
 */
- (void) setPoiWarnings:(NSMutableArray *) poiwarnings;

@end
