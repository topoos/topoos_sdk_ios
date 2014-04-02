//
//  TOSAccessResGeocoding.h
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
#import "TOS_GeocodingData.h"

@interface TOSAccessResGeocoding : TOSAccessRes


@property (nonatomic,retain) NSMutableArray *  Geocoding;

/**
 * Instantiates a new checkin collection result.
 */
-(TOSAccessResGeocoding *) init;

/**
 * Instantiates a new checkin collection result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResGeocoding *) initWithError: (NSString*) error andResult: (id) result;

/**
 * Instantiates a new pOI category collection result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param Geocoding data array
 *            the TOS_GeocodingData collection
 */
-(TOSAccessResGeocoding *) initWithError: (NSString*) error andResult: (id) result andGeocodingDataCollection: (NSMutableArray *) geocodingDataCollection;

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;


/**
 * @return the geocoding
 */
-(NSMutableArray *) getGeocoding ;


/**
 * @param geocoding the geocoding to set
 */
-(void) setGeocoding:(NSMutableArray *) geocoding ;



@end
