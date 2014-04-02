//
//  TOS_Profile.h
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

@interface TOS_Profile : NSObject
/** The Birthday. */
@property (nonatomic,retain) NSDate * Birthday;

/** The Gender. */
@property (nonatomic,retain) NSString * Gender;
/**
 * Instantiates a new profile.
 *
 * @param birthday the birthday
 * @param gender the gender
 */
-(TOS_Profile *) init;

-(TOS_Profile *) initWithBirthday: (NSDate *) birthday andGender: (NSString *) gender;


/**
 * get the birthday.
 *
 * @return Date of birthday
 */
- (NSDate *) getBirthday ;

/**
 * Set the birthday date.
 *
 * @param birthday date of birthday to set
 */
- (void) setBirthday:(NSDate *) birthday ;

/**
 * get the gender.
 *
 * @return the gender
 */
- (NSString *) getGender ;

/**
 * Sets the gender.
 *
 * @param gender gender to set
 */
- (void) setGender:(NSString *) gender;

@end
