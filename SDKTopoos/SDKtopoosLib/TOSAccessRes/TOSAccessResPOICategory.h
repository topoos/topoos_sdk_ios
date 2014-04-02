//
//  TOSAccessResPOICategory.h
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
#import "TOS_POICategory.h"

@interface TOSAccessResPOICategory : TOSAccessRes

/** The poi category. */
@property (nonatomic,retain) TOS_POICategory * POICategory;

/**
 * Instantiates a new pOI category result.
 */
-(TOSAccessResPOICategory *) init;

/**
 * Instantiates a new pOI category result.
 *
 * @param error the error
 * @param result the result
 */
-(TOSAccessResPOICategory *) initWithError: (NSString*) error andResult: (id) result;

/**
 * Instantiates a new pOI category result.
 *
 * @param error the error
 * @param result the result
 * @param poiCategory the poi category
 */
-(TOSAccessResPOICategory *) initWithError: (NSString*) error andResult: (id) result andPOICategory: (TOS_POICategory *) poiCategory;

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;

/**
 * Gets the poi category .
 * @return the poiCategory
 */
- (TOS_POICategory *) getPoiCategory;

/**
 * Sets the poi category .
 * @param poiCategory the poiCategory to set
 */
- (void) setPoiCategory: (TOS_POICategory *) poiCategory;

@end
