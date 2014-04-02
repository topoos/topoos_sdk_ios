//
//  TOSAccessResPositions.h
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

@interface TOSAccessResPositions : TOSAccessRes

/** The position. */
@property (nonatomic,retain) TOS_Position * position;

/**
 * Instantiates a new position result.
 */
- (TOSAccessResPositions *) init;

/**
 * Instantiates a new position result.
 *
 * @param error the error
 * @param result the result
 */
- (TOSAccessResPositions *) initWithError: (NSString*) error andResult: (NSString*) result;

/**
 * Instantiates a new position result.
 *
 * @param error the error
 * @param result the result
 * @param pos the position
 */
- (TOSAccessResPositions *) initWithError: (NSString*) error andResult: (NSString*) result andPosition: (TOS_Position*) pos;

/*
 * (non-Javadoc)
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;

/**
 * Gets the position.
 * @return the position
 */
- (TOS_Position *) getPosition;

/**
 * Sets the position.
 * @param position the position to set
 */
- (void) setPosition: (TOS_Position *) position;


@end
