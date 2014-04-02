//
//  TOS_User.h
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
#import <Foundation/Foundation.h>
#import "TOS_User.h"
#import "TOS_Profile.h"
#import "TOS_Accreditation.h"

@interface TOS_User : NSObject
/** The Id. */
@property (nonatomic,retain) NSString *  Identifier;

/** The Name. */
@property (nonatomic,retain) NSString *  Name;

/** The Email. */
@property (nonatomic,retain) NSString *  Email;

/** The Profile. */
@property (nonatomic,retain) TOS_Profile * Profile;

/** The Ugroup. */
@property (nonatomic,retain) NSMutableArray * Ugroup;

/** The Ugroup. */
@property (nonatomic,retain) NSNumber * Ugroupf;

/** The Acreditation. */
@property (nonatomic,retain) TOS_Accreditation * Accreditation;

-(TOS_User *) init;

-(TOS_User *) initWithId: (NSString *) identifier andName: (NSString *) name andEmail: (NSString *) email  andProfile:(TOS_Profile*) profile
               andUgroup:(NSMutableArray *) ugroup andAcreditation:(TOS_Accreditation *) accreditation;

/**
 * get the id.
 *
 * @return the id
 */
- (NSString *) getId ;
/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setId:(NSString *) identifier ;

/**
 * get the name.
 *
 * @return the name
 */
- (NSString *) getName ;

/**
 * Sets the name.
 *
 * @param name the name to set
 */
- (void) setName:(NSString *) name ;

/**
 * get the email.
 *
 * @return the email
 */
- (NSString *) getEmail ;

/**
 * Sets the email.
 *
 * @param email the email to set
 */
- (void) setEmail:(NSString *) email ;

/**
 * get the profile.
 *
 * @return the profile
 */
- (TOS_Profile *) getProfile;

/**
 * Sets the profile.
 *
 * @param profile the profile to set
 */
- (void) setProfile:(TOS_Profile *) profile ;
/**
 * get the id of the group.
 *
 * @return the ugroup
 */
- (NSMutableArray *) getUgroup ;

/**
 * Sets the ugroup.
 *
 * @param ugroup the ugroup to set
 */
- (void) setUgroup:(NSMutableArray *) ugroup ;

/**
 * get the acreditation.
 *
 * @return the acreditation
 */
- (TOS_Accreditation *) getAccreditation;

/**
 * Sets the acreditation.
 *
 * @param acreditation the acreditation to set
 */
- (void) setAcreditation:(TOS_Accreditation *) accreditation ;

@end
