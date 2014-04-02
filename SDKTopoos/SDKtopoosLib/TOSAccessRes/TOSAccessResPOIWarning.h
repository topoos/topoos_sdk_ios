//
//  TOSAccessResPOIWarning.h
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
#import "TOSAccessRes.h"
#import "TOS_POIWarning.h"

@interface TOSAccessResPOIWarning : TOSAccessRes

/** The poi warning. */
@property (nonatomic,retain) TOS_POIWarning * PoiWarning;

/**
 * Instantiates a new POIWarning result.
 */
- (TOSAccessResPOIWarning *) init;

/**
 * Instantiates a new POIWarning result.
 *
 * @param error the error
 * @param result the result
 */
- (TOSAccessResPOIWarning *) initWithError: (NSString*) error andResult: (NSString*) result;

/**
 * Instantiates a new POIWarning result.
 *
 * @param error the error
 * @param result the result
 * @param pos the position
 */
- (TOSAccessResPOIWarning *) initWithError: (NSString*) error andResult: (NSString*) result andPosition: (TOS_POIWarning*) poiw;

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;

/**
 * Gets the poi warning.
 * @return the poi warning
 */
- (TOS_POIWarning *) getPoiWarning;

/**
 * Sets the poi warning.
 * @param poiw the poi warning to set
 */
- (void) setPoiWarning: (TOS_POIWarning *) poiw;

@end
