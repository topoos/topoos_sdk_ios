//
//  TOS_UserIdPosition.m
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
#import "TOS_UserIdPosition.h"

@implementation TOS_UserIdPosition 

@synthesize Userid, UserPosition;

/**
 * Instantiates a new user id position.
 *
 * @param userid the userid
 * @param position the position
 */
-(TOS_UserIdPosition *) init {
    self=[super init];
    return self;
}

-(TOS_UserIdPosition *) initWithUserID: (NSString *) userid andUserPosition: (TOS_UserPosition *) user_position
{
    
    self=[super init];
    if(self){
        Userid = userid;
        UserPosition=user_position;
    }
    return self;
}

/**
 * get the user position.
 *
 * @return the position
 */
- (TOS_UserPosition *) getPosition {
    return UserPosition;
}

/**
 * Sets the position.
 *
 * @param position the position to set
 */
-(void) setPosition: (TOS_UserPosition *) user_position {
    UserPosition=user_position;
}

/**
 * get the user id.
 *
 * @return the userid
 */
- (NSString *) getUserid {
    return Userid;
}

/**
 * Sets the userid.
 *
 * @param userid the userid to set
 */
- (void) setUserid:(NSString *) userid {
    Userid = userid;
}

@end
