//
//  TOSAccessResPolygon.h
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

@interface TOSAccessResPolygon : TOSAccessRes


/** The polygon. */
@property (nonatomic,retain) NSMutableArray * Polygon;

/**
 * Instantiates a new polygon result.
 */
-(TOSAccessResPolygon *) init;
/**
 * Instantiates a new polygon result.
 *
 * @param error the error
 * @param result the result
 */
-(TOSAccessResPolygon *) initWithError: (NSString*) error andResult: (id) result;

/**
 * Instantiates a new polygon result.
 *
 * @param error the error
 * @param result the result
 * @param polygon the polygon
 */
-(TOSAccessResPolygon *) initWithError: (NSString*) error andResult: (id) result andPolygon: (NSMutableArray *) polygon;

/* (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;



/**
 * Gets the polygon.
 *
 * @return the polygon
 */
-(NSMutableArray *) getPolygon ;

/**
 * Sets the polygon.
 *
 * @param polygon the polygon to set
 */
-(void) setPolygon:(NSMutableArray *) polygon ;

@end
