//
//  TOSAccessResUser.h
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
#import "TOS_User.h"
#import "TOS_Profile.h"
#import "TOS_VisibleDevice.h"
#import "TOS_Accreditation.h"


@interface TOSAccessResUser : TOSAccessRes

@property (nonatomic,retain) TOS_User * User;

-(TOSAccessResUser *) init;

/**
 * Instantiates a new user result.
 *
 * @param error
 *            the error
 * @param result
 *            the result
 */
-(TOSAccessResUser *) initWithError: (NSString*) error andResult: (id) result;

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
-(TOSAccessResUser *) initWithError: (NSString*) error andResult: (id) result andUser: (TOS_User*) user;

/*
 * (non-Javadoc)
 *
 * @see topoos.APIAccess.Results.APICallResult#setParameters()
 */
- (void) setParameters;


/**
 * Gets the user.
 *
 * @return the user
 */
- (TOS_User *) getUser ;
/**
 * Sets the user.
 *
 * @param user
 *            the user to set
 */
- (void) setUser :(TOS_User *) user ;

@end
