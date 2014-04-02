//
//  TOS_PositionType.m
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

#import "TOS_PositionType.h"

@implementation TOS_PositionType

@synthesize Identifier, Description;

/**
 * Instantiates a new position_type.
 *
 * @param id the id
 * @param description the description
 */
-(TOS_PositionType*) init{
    self=[super init];
    return self;
}

-(TOS_PositionType*) initWithId: (NSString *) identifier andDescription: (NSString *) description{
    self=[super init];
    return self;
}

/**
 * get the Identifier.
 * @return the Identifier
 */
- (NSString *) getIdentifier {
    return Identifier;
}

/**
 * Sets the Identifier.
 * @param id the Identifier to set
 */
- (void) setIdentifier: (NSString *) ide {
    Identifier = ide;
}

/**
 * get the Description.
 * @return the Description
 */
- (NSString *) getDescription {
    return Description;
}

/**
 * Sets the Description.
 * @param desc the Description to set
 */
- (void) setDescription: (NSString *) desc {
    Description = desc;
}

@end
