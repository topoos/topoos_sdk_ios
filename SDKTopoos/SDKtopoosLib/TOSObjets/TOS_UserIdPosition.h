//
//  TOS_UserIdPosition.h
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

#import <Foundation/Foundation.h>
#import "TOS_UserPosition.h"

@interface TOS_UserIdPosition : NSObject
/** The userid. */
@property (nonatomic,retain) NSString * Userid;

/** The position. */
@property (nonatomic,retain) TOS_UserPosition * UserPosition;

/**
 * Instantiates a new user id position.
 *
 * @param userid the userid
 * @param position the position
 */
-(TOS_UserIdPosition *) init;
-(TOS_UserIdPosition *) initWithUserID: (NSString *) userid andUserPosition: (TOS_UserPosition *) user_position;



@end
