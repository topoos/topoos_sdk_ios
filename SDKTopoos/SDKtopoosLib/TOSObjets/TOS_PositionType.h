//
//  TOS_PositionType.h
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

@interface TOS_PositionType : NSObject

/**
 * V0
 */

/** The id. */
@property (nonatomic,retain) NSString* Identifier ; //id

/** The device. */
@property (nonatomic,retain) NSString * Description ;

/**
 * Instantiates a new position type.
 *
 * @param id the id
 * @param description the description
 */
-(TOS_PositionType*) init;

-(TOS_PositionType*) initWithId: (NSString *) identifier andDescription: (NSString *) description;

/**
 * get the identifier.
 *
 * @return the identifier
 */
- (NSString *) getIdentifier;

/**
 * Sets the identifier.
 *
 * @param identifier the identifier to set
 */
- (void) setIdentifier: (NSString *) ide;

/**
 * get the Description.
 *
 * @return the Description
 */
- (NSString *) getDescription;

/**
 * Sets the Description.
 *
 * @param Description the Description to set
 */
- (void) setDescription: (NSString *) desc;

@end
