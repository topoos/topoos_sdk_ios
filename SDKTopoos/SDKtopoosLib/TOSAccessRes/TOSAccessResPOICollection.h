//
//  TOSAccessResPOICollection.h
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
#import "TOS_POICollection.h"
#import "TOS_POI.h"
@interface TOSAccessResPOICollection : TOSAccessRes

/** The poi category collection. */
@property (nonatomic,retain) TOS_POICollection * PoiCollection;

/**
 * Instantiates a new checkin collection result.
 */
-(TOSAccessResPOICollection *) init;

/**
 * Instantiates a new checkin collection result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResPOICollection *) initWithError: (NSString*) error andResult: (id) result;

/**
 * Instantiates a new pOI category collection result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param poiCategoryCollection
 *            the poi category collection
 */
-(TOSAccessResPOICollection *) initWithError: (NSString*) error andResult: (id) result andPOICategoryCollection: (TOS_POICollection *) poiCollection;


/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;

- (TOS_POI *) parsePOI: (NSDictionary *) job;



/**
 * Gets the poi category collection.
 *
 * @return the poiCategoryCollection
 */
-(TOS_POICollection *) getPoicollection ;

/**
 * Sets the poi category collection.
 *
 * @param poiCategoryCollection
 *            the poiCategoryCollection to set
 */
-(void)setPoicollection:(TOS_POICollection *) poiCollection ;
@end
