//
//  TOSAccessResCheckin.h
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
#import "TOS_Checkin.h"

@interface TOSAccessResCheckin : TOSAccessRes

/** The checkin. */
@property (nonatomic,retain) TOS_Checkin* Checkin;

/**
 * Instantiates a new user result.
 */
-(TOSAccessResCheckin *) init;

/**
 * Instantiates a new user result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResCheckin *) initWithError: (NSString*) error andResult: (id) result;

/**
 * Instantiates a new user result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param user
 *            the user
 */
-(TOSAccessResCheckin *) initWithError: (NSString*) error andResult: (id) result andCheckin: (TOS_Checkin*) checkin;

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */


- (void) setParameters;


/**
 * Gets the track.
 *
 * @return the track
 */
- (TOS_Checkin *) getCheckin ;

/**
 * Sets the track.
 *
 * @param track
 *            the track to set
 */
- (void) setCheckin:(TOS_Checkin *)checkin ;

@end
