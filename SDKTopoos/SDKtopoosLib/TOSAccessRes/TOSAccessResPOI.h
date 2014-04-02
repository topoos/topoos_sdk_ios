//
//  TOSAccessResPOI.h
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
#import "TOS_POI.h"
@interface TOSAccessResPOI : TOSAccessRes
/** The poi. */
@property (nonatomic,retain) TOS_POI * POI;

/**
 * Instantiates a new pOI result.
 */
-(TOSAccessResPOI *) init;

/**
 * Instantiates a new pOI result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResPOI*) initWithError: (NSString*) error andResult: (NSString*) result;

/**
 * Instantiates a new pOI result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param poi
 *            the poi
 */
-(TOSAccessResPOI*) initWithError: (NSString*) error andResult: (NSString*) result andPOI: (TOS_POI*) poi;

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters; 

/**
 * Gets the poi.
 * 
 * @return the poi
 */
- (TOS_POI *) getPoi;

/**
 * Sets the poi.
 * 
 * @param poi
 *            the poi to set
 */
-(void) setPoi:(TOS_POI* ) poi ;


@end
