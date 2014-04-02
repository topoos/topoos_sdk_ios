//
//  TOS_User.m
//  SDKtopoos
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

#import "TOS_User.h"

@implementation TOS_User


@synthesize  Identifier, Name, Email, Profile, Ugroup, Accreditation;

/**
 * Instantiates a new user.
 *
 * @param id the id
 * @param name the name
 * @param email the email
 * @param profile the profile
 * @param ugroup the ugroup
 * @param acreditation the acreditation
 */
-(TOS_User *) init{
    self=[super init];
    return self;
}

-(TOS_User *) initWithId: (NSString *) identifier andName: (NSString *) name andEmail: (NSString *) email  andProfile:(TOS_Profile*) profile
         andUgroup:(NSMutableArray *) ugroup andAcreditation:(TOS_Accreditation *) accreditation
        {
            
    self=[super init];
            if(self){
                Identifier=identifier;
                Name=name;
                Email=email;
                Profile=profile;
                Ugroup=ugroup;
                Accreditation=accreditation;
            }
    return self;
}


/**
 * get the id.
 *
 * @return the id
 */
- (NSString *) getId {
    return Identifier;
}

/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setId:(NSString *) identifier {
    Identifier = identifier;
}

/**
 * get the name.
 *
 * @return the name
 */
- (NSString *) getName {
    return Name;
}

/**
 * Sets the name.
 *
 * @param name the name to set
 */
- (void) setName:(NSString *) name {
    Name = name;
}

/**
 * get the email.
 *
 * @return the email
 */
- (NSString *) getEmail {
    return Email;
}

/**
 * Sets the email.
 *
 * @param email the email to set
 */
- (void) setEmail:(NSString *) email {
    Email = email;
}

/**
 * get the profile.
 *
 * @return the profile
 */
- (TOS_Profile *) getProfile {
    return Profile;
}

/**
 * Sets the profile.
 *
 * @param profile the profile to set
 */
- (void) setProfile:(TOS_Profile *) profile {
    Profile = profile;
}

/**
 * get the id of the group.
 *
 * @return the ugroup
 */
- (NSMutableArray *) getUgroup {
    return Ugroup;
}

/**
 * Sets the ugroup.
 *
 * @param ugroup the ugroup to set
 */
- (void) setUgroup:(NSMutableArray *) ugroup {
    Ugroup = ugroup;
}

/**
 * get the acreditation.
 *
 * @return the acreditation
 */
- (TOS_Accreditation *) getAccreditation {
    return Accreditation;
}

/**
 * Sets the acreditation.
 *
 * @param acreditation the acreditation to set
 */
- (void) setAcreditation:(TOS_Accreditation *) accreditation {
    Accreditation = accreditation;
}



@end
