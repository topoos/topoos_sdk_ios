//
//  TOSAccessResPositionsCollection.h
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
#import "TOS_Position.h"
#import "JSON.h"


@interface TOSAccessResPositionsCollection : TOSAccessRes

/** The positions. */
@property (nonatomic,retain) NSMutableArray * positions;

/**
 * Instantiates a new position collection result.
 */
- (TOSAccessResPositionsCollection *) init;

/**
 * Instantiates a new position collection result.
 * @param error the error
 * @param result the result
 */
- (TOSAccessResPositionsCollection *) initWithError: (NSString*) error andResult: (NSString*) result;

/**
 * Instantiates a new position collection result.
 * @param error the error
 * @param result the result
 * @param positions the positions
 */
- (TOSAccessResPositionsCollection *) initWithError: (NSString*) error andResult: (NSString*) result andPosition: (NSMutableArray*) pos;


/**
 * Gets the positions.
 * @return the positions
 */
- (NSMutableArray *) getPositions;

/**
 * Sets the positions.
 * @param positions the positions to set
 */
- (void) setPositions: (NSMutableArray *) positions;


/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;


/**
 * Parses the position.
 * @param job the job
 * @return the position
 * @throws TopoosException the topoos exception
 */
- (TOS_Position *) parsePosition: (NSDictionary *) job;

@end
