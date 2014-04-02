//
//  TOSAccessResTrackExport.h
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

@interface TOSAccessResTrackExport : TOSAccessRes

/** The trackresource. */
@property (nonatomic,retain) NSString * Trackresource;

/**
 * Instantiates a track resource result.
 */
-(TOSAccessResTrackExport *) init;


/**
 * Instantiates a track resource result.
 *
 * @param error the error
 * @param result the result
 */
-(TOSAccessResTrackExport *) initWithError: (NSString*) error andResult: (id) result;

/**
 * Instantiates a new polygon result.
 *
 * @param error the error
 * @param result the result
 * @param track the track
 */
-(TOSAccessResTrackExport *) initWithError: (NSString*) error andResult: (id) result andPolygon: (NSString *) track;



/* (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
-(void) setParameters;
/**
 * Gets the trackresource.
 *
 * @return the trackresource
 */
-(NSString *) getTrackResource ;

/**
 * Sets the webmapuri.
 *
 * @param trackresource the trackresource to set
 */
-(void) setTrackresource: (NSString *) trackresource ;

@end
