//
//  TOSAccessResUsersNear.h
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
#import "TOS_UsersNear.h"
#import "TOS_UserIdPosition.h"
@interface TOSAccessResUsersNear : TOSAccessRes

/** The usersnear. */
@property (nonatomic,retain) TOS_UsersNear * Usersnear;

/**
 * Instantiates a new users near result.
 */
/**
 * Instantiates a new user result.
 */
-(TOSAccessResUsersNear *) init;

/**
 * Instantiates a new user result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResUsersNear *) initWithError: (NSString*) error andResult: (id) result;

/**
 * Instantiates a new users near result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 * @param usersnear
 *            the usersnear
 */
-(TOSAccessResUsersNear *) initWithError: (NSString*) error andResult: (id) result andUser: (TOS_UsersNear*) usersnear;

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
-  (void) setParameters;

/**
 * Gets the usersnear.
 *
 * @return the usersnear
 */
- (TOS_UsersNear* ) getUsersnear ;

/**
 * Sets the usersnear.
 *
 * @param usersnear
 *            the usersnear to set
 */
- (void) setUsersnear:(TOS_UsersNear*) usersnear ;


@end
