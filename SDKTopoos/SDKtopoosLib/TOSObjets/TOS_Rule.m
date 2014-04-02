//
//  TOS_Rule.m
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

#import "TOS_Rule.h"

@implementation TOS_Rule

@synthesize Identifier, Type ;

/**
 * Instantiates a new rule.
 *
 * @param id the id
 * @param type the type
 */
-(TOS_Rule*) init
{
    self=[super init];
    return self;
}

-(TOS_Rule*) initWithId: (int ) identifier andType: (NSString *) type
{
    self=[super init];
    Identifier=identifier;
    Type=type;
    return self;
}

/**
 * get the id.
 * @return the id
 */
- (int ) getIdentifier
{
    return Identifier;
}

/**
 * Sets the id.
 *
 * @param id the id to set
 */
- (void) setIdentifier: (int ) identifier
{
    Identifier = identifier;
}

/**
 * get the type.
 * @return the type
 */
- (NSString *) getType
{
    return Type;
}

/**
 * Sets the type.
 *
 * @param type the type to set
 */
- (void) setType: (NSString *) type
{
    Type = type;
}




@end
